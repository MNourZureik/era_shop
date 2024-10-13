const Notification = require("./notification.model");

//import model
const User = require("../user/user.model");
const Seller = require("../seller/seller.model");

//config
var config = require("../../config");

//private key
const admin = require("../../util/privateKey");

//get notification list
exports.getNotificationList = async (req, res) => {
  try {
    if (!req.query.userId) {
      return res.status(200).json({ status: false, message: "Oops ! Invalid details!" });
    }

    const [user, notification] = await Promise.all([User.findById(req.query.userId), Notification.find({ userId: req.query.userId }).sort({ createdAt: -1 })]);

    if (!user) {
      return res.status(200).json({ status: false, message: "User does not found!" });
    }

    if (user.isBlock) {
      return res.status(200).json({ status: false, message: "you are blocked by admin!" });
    }

    return res.status(200).json({
      status: true,
      message: "Retrive the notification list by the user!",
      notification,
    });
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      status: false,
      error: error.message || "Internal Server Error",
    });
  }
};

//send notifications sellers or users or both
exports.sendNotifications = async (req, res) => {
  try {
    if (req.query.notificationType.trim() === "User") {
      const userId = await User.find({ isBlock: false }).distinct("_id");

      await userId.map(async (data) => {
        const notification = new Notification();
        notification.userId = data._id;
        notification.title = req.body.title;
        notification.message = req.body.message;
        notification.image = req.file ? config.baseURL + req.file.path : "";
        notification.date = new Date().toLocaleString("en-US", { timeZone: "Asia/Kolkata" });
        await notification.save();
      });

      const userFCM = await User.find({ isBlock: false }).distinct("fcmToken");
      console.log("fcmToken in user: ", userFCM);

      if (userFCM.length !== 0) {
        const adminPromise = await admin;

        const payload = {
          tokens: userFCM,
          notification: {
            title: req.body.title,
            body: req.body.message,
          },
        };

        adminPromise
          .messaging()
          .sendMulticast(payload)
          .then((response) => {
            console.log("Successfully sent with response: ", response);
          })
          .catch((error) => {
            console.log("Error sending message:      ", error);
          });
      }

      return res.status(200).json({ status: true, message: "Success" });
    } else if (req.query.notificationType.trim() === "Seller") {
      const sellerId = await Seller.find({ isBlock: false }).distinct("_id");

      await sellerId.map(async (data) => {
        const notification = new Notification();
        notification.sellerId = data._id;
        notification.title = req.body.title;
        notification.message = req.body.message;
        notification.image = req.file ? config.baseURL + req.file.path : "";
        notification.date = new Date().toLocaleString("en-US", { timeZone: "Asia/Kolkata" });
        await notification.save();
      });

      const sellerFCM = await Seller.find({ isBlock: false }).distinct("fcmToken");
      console.log("fcmToken in user: ", sellerFCM);

      if (sellerFCM.length !== 0) {
        const adminPromise = await admin;

        const payload = {
          tokens: sellerFCM,
          notification: {
            title: req.body.title,
            body: req.body.message,
          },
        };

        adminPromise
          .messaging()
          .sendMulticast(payload)
          .then((response) => {
            console.log("Successfully sent with response: ", response);
          })
          .catch((error) => {
            console.log("Error sending message:      ", error);
          });
      }

      return res.status(200).json({ status: true, message: "Success" });
    } else if (req.query.notificationType.trim() === "Both") {
      const userIds = await User.find({ isBlock: false }).distinct("_id");

      // Send notifications to users
      await Promise.all(
        userIds.map(async (userId) => {
          const notification = new Notification();
          notification.userId = userId._id;
          notification.title = req.body.title;
          notification.message = req.body.message;
          notification.image = req.file ? config.baseURL + req.file.path : "";
          notification.date = new Date().toLocaleString("en-US", { timeZone: "Asia/Kolkata" });
          await notification.save();
        })
      );

      const userFCM = await User.find({ isBlock: false }).distinct("fcmToken");
      console.log("fcmToken in user type both: ", userFCM);

      if (userFCM.length !== 0) {
        const adminPromise = await admin;

        const payload = {
          tokens: userFCM,
          notification: {
            title: req.body.title,
            body: req.body.message,
          },
        };

        adminPromise
          .messaging()
          .sendMulticast(payload)
          .then((response) => {
            console.log("Successfully sent with response: ", response);
          })
          .catch((error) => {
            console.log("Error sending message:      ", error);
          });
      }

      // Send notifications to sellers
      const sellerIds = await Seller.find({ isBlock: false }).distinct("_id");

      await Promise.all(
        sellerIds.map(async (sellerId) => {
          const notification = new Notification();
          notification.sellerId = sellerId._id;
          notification.title = req.body.title;
          notification.message = req.body.message;
          notification.image = req.file ? config.baseURL + req.file.path : "";
          notification.date = new Date().toLocaleString("en-US", { timeZone: "Asia/Kolkata" });
          await notification.save();
        })
      );

      const sellerFCM = await Seller.find({ isBlock: false }).distinct("fcmToken");
      console.log("fcmToken in seller type both: ", sellerFCM);

      if (sellerFCM.length !== 0) {
        const adminPromise = await admin;

        const payload = {
          tokens: sellerFCM,
          notification: {
            title: req.body.title,
            body: req.body.message,
          },
        };

        adminPromise
          .messaging()
          .sendMulticast(payload)
          .then((response) => {
            console.log("Successfully sent with response: ", response);
          })
          .catch((error) => {
            console.log("Error sending message:      ", error);
          });
      }

      return res.status(200).json({ status: true, message: "Success" });
    } else {
      return res.status(200).json({ status: false, message: "please pass the valid notificationType!" });
    }
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      status: false,
      error: error.message || "Internal Server Error",
    });
  }
};

//send notification to particular seller
exports.particularSellerNotification = async (req, res) => {
  try {
    if (!req.query.sellerId) {
      return res.status(200).json({ status: false, message: "sellerId must be requried!" });
    }

    const seller = await Seller.findById(req.query.sellerId);
    if (!seller) {
      return res.status(200).json({ status: false, message: "Seller does not found!" });
    }

    if (!seller.isBlock && seller.fcmToken !== null) {
      const adminPromise = await admin;

      const payload = {
        token: seller.fcmToken,
        notification: {
          body: req.body.message,
          title: req.body.title,
          image: req.file ? config.baseURL + req.file.path : "",
        },
      };

      adminPromise
        .messaging()
        .send(payload)
        .then(async (response) => {
          console.log("Successfully sent with response: ", response);

          const notification = new Notification();
          notification.sellerId = seller._id;
          notification.title = req.body.title;
          notification.message = req.body.message;
          notification.image = req.file ? config.baseURL + req.file.path : "";
          notification.date = new Date().toLocaleString("en-US", { timeZone: "Asia/Kolkata" });
          await notification.save();
        })
        .catch((error) => {
          console.log("Error sending message:      ", error);
        });
    }

    return res.status(200).json({ status: true, message: "Success" });
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      status: false,
      error: error.message || "Internal Server Error",
    });
  }
};
