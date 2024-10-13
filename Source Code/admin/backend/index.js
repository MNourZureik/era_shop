//import mongoose
const mongoose = require("mongoose");

//import express
const express = require("express");
const app = express();

//import cors
const cors = require("cors");
app.use(cors());
app.use(express.json());

//logging middleware
var logger = require("morgan");
app.use(logger("dev"));

//import path
const path = require("path");

//fs
const fs = require("fs");

//Config
const config = require("./config");

//import model
const Setting = require("./server/setting/setting.model");

//settingJson
const settingJson = require("./setting");

//Declare global variable
global.settingJSON = {};

//handle global.settingJSON when pm2 restart
async function initializeSettings() {
  try {
    const setting = await Setting.findOne().sort({ createdAt: -1 });
    if (setting) {
      console.log("In setting initialize Settings");
      global.settingJSON = setting;
    } else {
      global.settingJSON = settingJson;
    }
  } catch (error) {
    console.error("Failed to initialize settings:", error);
  }
}

module.exports = initializeSettings();

//Declare the function as a global variable to update the setting.js file
global.updateSettingFile = (settingData) => {
  const settingJSON = JSON.stringify(settingData, null, 2);
  fs.writeFileSync("setting.js", `module.exports = ${settingJSON};`, "utf8");

  global.settingJSON = settingData; // Update global variable
  console.log("Settings file updated.", global.settingJSON.privacyPolicyText);
};

app.use(express.static(path.join(__dirname, "public")));
app.use("/storage", express.static(path.join(__dirname, "storage")));

//route.js
const Route = require("./route");
app.use("/", Route);

//Public File
app.get("/*", (req, res) => {
  res.status(200).sendFile(path.join(__dirname, "public", "index.html"));
});

mongoose.connect(config?.MONGODB_CONNECTION_STRING, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

//socket io
const http = require("http");
const server = http.createServer(app);
global.io = require("socket.io")(server);

//socket.js
require("./socket");

//import model
const SellerWallet = require("./server/sellerWallet/sellerWallet.model");

//node-cron
const cron = require("node-cron");

//Schedule a task to run on the last day of every month at 11:59 PM
cron.schedule("59 23 28-31 * *", async () => {
  console.log("This task will run on the last day of every month");
  try {
    const existSellerWallet = await SellerWallet.find({ type: 2, status: "Pending" });
    console.log("existSellerWallet length in index.js: ", existSellerWallet.length);

    //update existing wallet on the last day of every month with type 3 and status "Pending"
    await SellerWallet.updateMany(
      {
        type: 2,
        status: "Pending",
      },
      [
        {
          $set: {
            type: 3,
            status: "Pending",
          },
        },
      ]
    );

    console.log("Updated seller wallets with type 3 and status Pending successfully");
  } catch (error) {
    console.error("Error updating seller wallets: ", error);
  }
});

//mongoose connection
const db = mongoose.connection;
db.on("error", console.error.bind(console, "connection error:"));
db.once("open", () => {
  console.log("MONGO: successfully connected to db");
});

//Set port and listen the request
server.listen(config.PORT, () => {
  console.log("Hello World ! listening on " + config.PORT);
});
