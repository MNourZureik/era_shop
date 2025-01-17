const Follower = require("./follower.model");

//import model
const User = require("../user/user.model");
const Seller = require("../seller/seller.model");

//private key
const admin = require("../../util/privateKey");

//mongoose
const mongoose = require("mongoose");

//follow unfollow the seller
exports.followUnfollow = async (req, res) => {
  try {
    if (!req.body.userId || !req.body.sellerId) {
      return res.status(200).json({ status: false, message: "Oops ! Invalid details!" });
    }

    const user = new mongoose.Types.ObjectId(req.body.userId);
    const seller = new mongoose.Types.ObjectId(req.body.sellerId);

    const [userId, sellerId, follow] = await Promise.all([
      User.findById(user),
      Seller.findById(seller),
      Follower.findOne({
        userId: user,
        sellerId: seller,
      }),
    ]);

    if (!userId) {
      return res.status(200).json({ status: false, message: "user does not found!" });
    }

    if (userId.isBlock) {
      return res.status(200).json({ status: false, message: "you are blocked by admin!" });
    }

    if (!sellerId) {
      return res.status(200).json({ status: false, message: "seller does not found!" });
    }

    if (follow) {
      await Promise.all([
        Follower.deleteOne({ userId: userId._id, sellerId: sellerId._id }),
        User.updateOne({ _id: userId._id, following: { $gt: 0 } }, { $inc: { following: -1 } }),
        Seller.updateOne({ _id: sellerId._id, followers: { $gt: 0 } }, { $inc: { followers: -1 } }),
      ]);

      return res.status(200).send({
        status: true,
        message: "Unfollow successfully!",
        isFollow: false,
      });
    } else {
      const follower = new Follower({
        userId: userId._id,
        sellerId: sellerId._id,
      });

      await Promise.all([follower.save(), userId.updateOne({ $inc: { following: 1 } }), sellerId.updateOne({ $inc: { followers: 1 } })]);

      res.status(200).send({
        status: true,
        message: "follow Successfully!",
        isFollow: true,
      });

      //notification related
      if (!sellerId.isBlock && sellerId.fcmToken !== null) {
        const adminPromise = await admin;

        const payload = {
          token: sellerId.fcmToken,
          notification: {
            title: `${userId.firstName} started following you!`,
          },
          data: {
            data: userId._id.toString(),
            type: "USER",
          },
        };

        adminPromise
          .messaging()
          .send(payload)
          .then((response) => {
            console.log("Successfully sent with response: ", response);
          })
          .catch((error) => {
            console.log("Error sending message:      ", error);
          });
      }
    }
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      status: false,
      error: error.message || "Internal Server Error",
    });
  }
};
