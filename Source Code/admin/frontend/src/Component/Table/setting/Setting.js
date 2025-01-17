import { useEffect, useState } from "react";
import Input from "../../extra/Input";
import SettingBox from "./SettingBox";
import { connect, useDispatch, useSelector } from "react-redux";
import {
  getSetting,
  updateSetting,
  handleToggleSwitch,
} from "../../store/setting/setting.action";
import { getWithdraw } from "../../store/withdraw/withdraw.action";
import Button from "../../extra/Button";


const Setting = (props) => {
  const { setting } = useSelector((state) => state.setting);
  
  const dispatch = useDispatch();
  // box 1
  const [settingId, setSettingId] = useState("");
  const [zegoAppId, setZegoAppId] = useState("");
  const [zegoAppSignIn, setZegoAppSignIn] = useState("");
  // box 2
  const [privacyPolicyLink, setPrivacyPolicyLink] = useState("");
  const [privacyPolicyText, setPrivacyPolicyText] = useState("");

  const [isFakeData, setIsFakeData] = useState(false);

  // box 3

  // box 7
  const [isAddProductRequest, setIsAddProductRequest] = useState(false);
  const [isUpdateProductRequest, setIsUpdateProductRequest] = useState(false);
  const [privateKey, setPrivateKey] = useState();

  // error

  const [error, setError] = useState({
    zegoAppId: "",
    zegoAppSignIn: "",
    privacyPolicyLink: "",
    privacyPolicyText: "",
    // shippingCharges: "",
    withdrawCharges: "",
    withdrawLimit: "",
    cancelOrderCharges: "",
    adminCommissionCharges: "",
    razorPayId: "",
    razorSecretKey: "",
    stripePublishableKey: "",
    stripeSecretKey: "",
    privateKey,
  });

  useEffect(() => {
    dispatch(getSetting());
    dispatch(getWithdraw());
  }, [dispatch]);

  //onselect function of selecting multiple values

  //onRemove function for remove multiple values

  useEffect(() => {
    setSettingId(setting?._id);
    // box 1
    setZegoAppId(setting?.zegoAppId);
    setZegoAppSignIn(setting?.zegoAppSignIn);
    // box 2
    setPrivacyPolicyLink(setting?.privacyPolicyLink);
    setPrivacyPolicyText(setting?.privacyPolicyText);
    setIsFakeData(setting?.isFakeData);

    // box 7
    setIsAddProductRequest(setting?.isAddProductRequest);
    setIsUpdateProductRequest(setting?.isUpdateProductRequest);
    setPrivateKey(JSON.stringify(setting?.privateKey));
  }, [setting]);

  const handleSubmit = () => {
    if (
      !zegoAppId ||
      !zegoAppSignIn ||
      !privacyPolicyLink ||
      !privacyPolicyText
    ) {
      let error = {};
      if (!zegoAppId) error.zegoAppId = "ZegoAppId Is Required ";
      if (!zegoAppSignIn) error.zegoAppSignIn = "ZegoAppSignIn Is Required ";
      if (!privacyPolicyLink)
        error.privacyPolicyLink = "Privacy Policy Link Is Required ";
      if (!privacyPolicyText)
        error.privacyPolicyText = "Privacy Policy Text Is Required ";

      return setError({ ...error });
    } else {
      
      let settingData = {
        zegoAppId,
        zegoAppSignIn,
        privacyPolicyLink,
        privacyPolicyText,
        privateKey,
      };

      props.updateSetting(settingData, setting?._id);
    }
  };

  const handleClick = (type) => {
    //Handle Update Switch Value
    
    props.handleToggleSwitch(setting._id, type, setting);
  };

  return (
    <>
      <div className="mainSettingBar">
        <div className="settingBar ">
          <div className="settingHeader primeHeader">
            <div className="row align-items-center">
              <div className="col-6"></div>
              <div className="col-6 text-end"></div>
            </div>
          </div>
          <div className="settingMain">
            <div className="row">
              {/*-------------- Box 1 --------------*/}
              <SettingBox title={`Zegocloud Setting`}>
                <Input
                  type={`text`}
                  label={`Zegocloud App Id`}
                  value={zegoAppId}
                  newClass={`col-12`}
                  placeholder={`Enter Your Zegocloud App Id....`}
                  errorMessage={error.zegoAppId && error.zegoAppId}
                  onChange={(e) => {
                    setZegoAppId(e.target.value);
                    if (!e.target.value) {
                      return setError({
                        ...error,
                        zegoAppId: `Zegocloud App Id Is Required`,
                      });
                    } else {
                      return setError({
                        ...error,
                        zegoAppId: "",
                      });
                    }
                  }}
                />
                <Input
                  type={`text`}
                  label={`Zegocloud App Sign In`}
                  value={zegoAppSignIn}
                  newClass={`col-12`}
                  errorMessage={error.zegoAppSignIn && error.zegoAppSignIn}
                  onChange={(e) => {
                    setZegoAppSignIn(e.target.value);
                    if (!e.target.value) {
                      return setError({
                        ...error,
                        zegoAppSignIn: `Zegocloud App Sign In Is Required`,
                      });
                    } else {
                      return setError({
                        ...error,
                        zegoAppSignIn: "",
                      });
                    }
                  }}
                />
              </SettingBox>

              {/*-------------- Box 2 --------------*/}
              <SettingBox title={`App Setting`}>
                <Input
                  type={`text`}
                  label={`Privacy Policy Link ( redirect user to this link in app )`}
                  value={privacyPolicyLink}
                  newClass={`col-12`}
                  placeholder={`Enter You Privacy Policy Link....`}
                  errorMessage={
                    error.privacyPolicyLink && error.privacyPolicyLink
                  }
                  onChange={(e) => {
                    setPrivacyPolicyLink(e.target.value);
                    if (!e.target.value) {
                      return setError({
                        ...error,
                        privacyPolicyLink: `Privacy Policy Link Is Required`,
                      });
                    } else {
                      return setError({
                        ...error,
                        privacyPolicyLink: "",
                      });
                    }
                  }}
                />

                <Input
                  type={`text`}
                  label={`Privacy Policy Text`}
                  value={privacyPolicyText}
                  newClass={`col-12`}
                  placeholder={`Enter You Privacy Policy Text....`}
                  errorMessage={
                    error.privacyPolicyText && error.privacyPolicyText
                  }
                  onChange={(e) => {
                    setPrivacyPolicyText(e.target.value);
                    if (!e.target.value) {
                      return setError({
                        ...error,
                        privacyPolicyText: `Privacy Policy Text Is Required`,
                      });
                    } else {
                      return setError({
                        ...error,
                        privacyPolicyText: "",
                      });
                    }
                  }}
                />
              </SettingBox>

              {/* Box 7 */}
              <SettingBox
                title={`Add Product Request`}
                title2={`New product request enable/disable for seller`}
                toggleSwitch={{
                  switchValue: isAddProductRequest,
                  handleClick: () => {
                    handleClick("productRequest");
                  },
                }}
              ></SettingBox>
              <SettingBox
                title={`Update Product Request`}
                title2={`Enable/disable product request update for seller`}
                toggleSwitch={{
                  switchValue: isUpdateProductRequest,
                  handleClick: () => {
                    handleClick("updateProductRequest");
                  },
                }}
              ></SettingBox>
              <SettingBox title={`Firebase Notification Setting `}>
                <div className="prime-input">
                  <label
                    className="float-left styleForTitle text-dark"
                    htmlFor="privateKey"
                  >
                    Private Key JSON ( To handle firebase push notification )
                  </label>
                  <textarea
                    name=""
                    className="form-control mt-2"
                    id="privateKey"
                    rows={10}
                    value={privateKey}
                    onChange={(e) => {
                      const newValue = e.target.value;
                      try {
                        const newData = JSON.parse(newValue);
                        setPrivateKey(newValue);
                        setError("");
                      } catch (error) {
                        // Handle invalid JSON input
                        console.error("Invalid JSON input:", error);
                        setPrivateKey(newValue);
                        return setError({
                          ...error,
                          privateKey: "Invalid JSON input",
                        });
                      }
                    }}
                  ></textarea>

                  {error.privateKey && (
                    <div className="pl-1 text-left">
                      <p className="errorMessage">{error.privateKey}</p>
                    </div>
                  )}
                </div>
              </SettingBox>
              <SettingBox
                title={`Fake Data`}
                title2={`Disable/Enable fake data in app`}
                toggleSwitch={{
                  switchName: " ",
                  switchValue: isFakeData,
                  handleClick: () => {
                    handleClick("isFakeData");
                  },
                }}
              ></SettingBox>
            </div>
            <div className="row mt-3">
              <div className="col-12 d-flex justify-content-end">
                <Button
                  newClass={`whiteFont`}
                  btnName={`Submit`}
                  btnColor={`btnBlackPrime`}
                  style={{ width: "90px", borderRadius: "6px" }}
                  onClick={(e) => handleSubmit(e)}
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default connect(null, {
  getSetting,
  updateSetting,
  handleToggleSwitch,
  getWithdraw,
})(Setting);
