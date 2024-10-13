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


const PaymentSetting = (props) => {
  const { setting } = useSelector((state) => state.setting);
  
  const dispatch = useDispatch();

  console.log('setting', setting)
  // box 1

  // box 3
  const [cancelOrderCharges, setCancelOrderCharges] = useState();
  const [adminCommissionCharges, setAdminCommissionCharges] = useState();
  // box 4
  const [razorPayId, setRazorPayId] = useState("");
  const [razorSecretKey, setRazorSecretKey] = useState("");
  const [razorPaySwitch, setRazorPaySwitch] = useState(false);
  // box 5
  const [stripePublishableKey, setStripePublishableKey] = useState("");
  const [stripeSecretKey, setStripeSecretKey] = useState("");
  const [stripeSwitch, setStripeSwitch] = useState(false);
  
  // box 6
  const [flutterWaveSwitch, setFlutterWaveSwitch] = useState(false);
  const [flutterWaveId, setFlutterWaveId] = useState("");


  // error

  const [error, setError] = useState({
    agoraKey: "",
    agoraCertificate: "",
    cancelOrderCharges: "",
    adminCommissionCharges: "",
    razorPayId: "",
    razorSecretKey: "",
    stripePublishableKey: "",
    stripeSecretKey: "",
    flutterWaveId : ""
  });

  useEffect(() => {
    dispatch(getSetting());
    dispatch(getWithdraw());
  }, [dispatch]);

  useEffect(() => {
    setCancelOrderCharges(setting?.cancelOrderCharges);
    setAdminCommissionCharges(setting?.adminCommissionCharges);
    // box 4
    setRazorPayId(setting?.razorPayId);
    setRazorSecretKey(setting?.razorSecretKey);
    setRazorPaySwitch(setting?.razorPaySwitch);
    // box 5
    setStripePublishableKey(setting?.stripePublishableKey);
    setStripeSecretKey(setting?.stripeSecretKey);
    setStripeSwitch(setting?.stripeSwitch);

    // box 6

    setFlutterWaveSwitch(setting?.flutterWaveSwitch)
    setFlutterWaveId(setting?.flutterWaveId)
  }, [setting]);

  const handleSubmit = () => {
    if (
      !cancelOrderCharges ||
      cancelOrderCharges <= 0 ||
      !adminCommissionCharges ||
      adminCommissionCharges <= 0 ||
      !razorPayId ||
      !razorSecretKey ||
      !stripePublishableKey ||
      !stripeSecretKey ||
      !flutterWaveId
    ) {
      let error = {};

      if (!cancelOrderCharges)
        error.cancelOrderCharges = "Cancel Order Charges Is Required";
      if (cancelOrderCharges <= 0)
        error.cancelOrderCharges = "Enter Correct Cancel Order Charges";

      if (!adminCommissionCharges)
        error.adminCommissionCharges = "Admin Commission Charges Is Required";
      if (adminCommissionCharges <= 0)
        error.adminCommissionCharges =
          "Enter Correct Admin Commission Charges ";

      if (!razorPayId) error.razorPayId = "RazorPay Id is requird!";
      if (!razorSecretKey)
        error.razorSecretKey = "RazorSecretKey Id is requird!";
      if (!stripePublishableKey)
        error.stripePublishableKey = "stripePublishableKey is required";
      if (!stripeSecretKey)
        error.stripeSecretKey = "stripeSecretKey is required";

      if (!flutterWaveId)
        error.flutterWaveId = "flutterWaveId is required";
      return setError({ ...error });
    } else {
      
      let settingData = {
        cancelOrderCharges,
        adminCommissionCharges,
        razorPayId,
        razorSecretKey,
        stripePublishableKey,
        stripeSecretKey,
        flutterWaveId
      };

      props.updateSetting(settingData, setting?._id);
    }
  };

  const handleClick = (type) => {
    //Handle Update Switch Value
    
    props.handleToggleSwitch(setting?._id, type);
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

              {/* Box 4  */}

              <SettingBox
                submit={(e) => handleSubmit(e)}
                title={`Razor Payment Setting`}
                toggleSwitch={{
                  switchName: "Razor Pay",
                  switchValue: razorPaySwitch,
                  handleClick: () => {
                    handleClick("razorPay");
                  },
                }}
              >
                <Input
                  type={`text`}
                  label={`RazorPay Id`}
                  value={razorPayId}
                  newClass={`col-12`}
                  placeholder={`Enter You razorPayId....`}
                  errorMessage={error.razorPayId && error.razorPayId}
                  onChange={(e) => {
                    setRazorPayId(e.target.value);
                    if (!e.target.value) {
                      return setError({
                        ...error,
                        razorPayId: `razorPayId Is Required`,
                      });
                    } else {
                      return setError({
                        ...error,
                        razorPayId: "",
                      });
                    }
                  }}
                />

                <Input
                  type={`text`}
                  label={`Razor Secret Key`}
                  value={razorSecretKey}
                  newClass={`col-12`}
                  placeholder={`Enter You RazorSecretKey....`}
                  errorMessage={error.razorSecretKey && error.razorSecretKey}
                  onChange={(e) => {
                    setRazorSecretKey(e.target.value);
                    if (!e.target.value) {
                      return setError({
                        ...error,
                        razorSecretKey: `Razor Secret Key Is Required`,
                      });
                    } else {
                      return setError({
                        ...error,
                        razorSecretKey: "",
                      });
                    }
                  }}
                />
              </SettingBox>

              {/* Box 5  */}

              <SettingBox
                submit={(e) => handleSubmit(e)}
                title={`Stripe Payment Setting`}
                toggleSwitch={{
                  switchName: "Stripe",
                  switchValue: stripeSwitch,
                  handleClick: () => {
                    handleClick("stripe");
                  },
                }}
              >
                <Input
                  type={`text`}
                  label={`Stripe Publishable Key`}
                  value={stripePublishableKey}
                  newClass={`col-12`}
                  placeholder={`Enter You stripe....`}
                  errorMessage={
                    error.stripePublishableKey && error.stripePublishableKey
                  }
                  onChange={(e) => {
                    setStripePublishableKey(e.target.value);
                    if (!e.target.value) {
                      return setError({
                        ...error,
                        stripePublishableKey: `Stripe Publishable Key Is Required`,
                      });
                    } else {
                      return setError({
                        ...error,
                        stripePublishableKey: "",
                      });
                    }
                  }}
                />

                <Input
                  type={`text`}
                  label={`Stripe Secret Key`}
                  value={stripeSecretKey}
                  newClass={`col-12`}
                  placeholder={`Enter You Stripe Secret Key....`}
                  errorMessage={error.stripeSecretKey && error.stripeSecretKey}
                  onChange={(e) => {
                    setStripeSecretKey(e.target.value);
                    if (!e.target.value) {
                      return setError({
                        ...error,
                        stripeSecretKey: `Stripe Secret Key Is Required`,
                      });
                    } else {
                      return setError({
                        ...error,
                        stripeSecretKey: "",
                      });
                    }
                  }}
                />
              </SettingBox>

              {/* box 3 */}

              <SettingBox title={`Charges Setting`}>
                <Input
                  type={`number`}
                  label={`Cancel Order Charges`}
                  value={cancelOrderCharges}
                  newClass={`col-6 pb-2`}
                  placeholder={`Enter You Cancle Order Charge....`}
                  errorMessage={
                    error.cancelOrderCharges && error.cancelOrderCharges
                  }
                  onChange={(e) => {
                    setCancelOrderCharges(e.target.value);
                    if (!e.target.value) {
                      return setError({
                        ...error,
                        cancelOrderCharges: `Cancle Order ChargeIs Required`,
                      });
                    } else {
                      return setError({
                        ...error,
                        cancelOrderCharges: "",
                      });
                    }
                  }}
                />

                <Input
                  type={`number`}
                  label={`Admin Commission Charges (%)`}
                  value={adminCommissionCharges}
                  newClass={`col-6`}
                  placeholder={`Enter You Admin Commission Charges`}
                  errorMessage={
                    error.adminCommissionCharges && error.adminCommissionCharges
                  }
                  onChange={(e) => {
                    setAdminCommissionCharges(e.target.value);
                    if (!e.target.value) {
                      return setError({
                        ...error,
                        adminCommissionCharges: `Admin Commission Charges Is Required`,
                      });
                    } else {
                      return setError({
                        ...error,
                        adminCommissionCharges: "",
                      });
                    }
                  }}
                />
              </SettingBox>


              <SettingBox
                submit={(e) => handleSubmit(e)}
                title={`Flutter Wave Setting`}
                toggleSwitch={{
                  switchName: "Flutter Wave" ,
                  switchValue: flutterWaveSwitch,
                  handleClick: () => {
                    handleClick("flutterWave");
                  },
                }}
              >
                <Input
                  type={`text`}
                  label={`FlutterWave Id`}
                  value={flutterWaveId}
                  newClass={`col-12`}
                  placeholder={`Enter You FlutterWaveId....`}
                  errorMessage={error.flutterWaveId && error.flutterWaveId}
                  onChange={(e) => {
                    setFlutterWaveId(e.target.value);
                    if (!e.target.value) {
                      return setError({
                        ...error,
                        flutterWaveId: `flutterWaveId Is Required`,
                      });
                    } else {
                      return setError({
                        ...error,
                        flutterWaveId: "",
                      });
                    }
                  }}
                />

              </SettingBox>

              {/* Box 6 */}
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
})(PaymentSetting);
