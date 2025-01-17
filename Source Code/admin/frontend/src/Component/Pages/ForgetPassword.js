import { useEffect, useState } from "react";
import Button from "../extra/Button";
import Input from "../extra/Input";
import { useNavigate } from "react-router-dom";
import { forgotPassword, loginAdmin } from "../store/admin/admin.action";
import { connect, useDispatch, useSelector } from "react-redux";

const ForgotPassword = (props) => {
  let navigate = useNavigate();
  const dispatch = useDispatch();

  const isAuth = useSelector((state) => state.admin.isAuth);

  useEffect(() => {
    isAuth && navigate("/admin");
  }, [isAuth]);


  const [email, setEmail] = useState("");

  const [error, setError] = useState({
    email: "",
    password: "",
  });

  const handleSubmit = () => {
    if (!email) {
      let error = {};
      if (!email) error.email = "Email Is Required !";
      return setError({ ...error });
    } else {
      let login = {
        email: email,
      };

      dispatch(forgotPassword(login));
    }
  };

  return (
    <>
      <div className="mainLoginPage">
        <div className="loginDiv">
          <div className="row">
            <div
              className="col-xl-6 d-xxl-block d-xl-block d-none  boxCenter"
              style={{ background: "#b93160" }}
            >
              <div
                className="p-5"
                style={{
                  background: "#b93160",
                }}
              >
                <img
                  className="img-fluid"
                  src={require("../../assets/images/Group 2033 1.png")}
                  alt=""
                  srcset=""
                />
              </div>
            </div>
            <div className="col-xl-6 col-md-12 boxCenter">
              <div className="loginDiv2">
                <div className="loginPage pt-3">
                  <div className="my-4">
                    <div className="loginLogo  me-3 pt-1 pe-1">
                      <img
                        src={require("../../assets/images/Frame 162747.png")}
                        alt=""
                        width={"80px"}
                      />
                    </div>
                  </div>
                  <div
                    style={{
                      fontSize: "16px",
                      fontWeight: "400",
                      lineHeight: "22px",
                      letterSpacing: "0.48px",
                    }}
                    className=""
                  >
                    <p className="fw-bold">
                      If you have forgotten your password you can reset it here!
                    </p>
                  </div>

                  <div className="loginInput">
                    <Input
                      label={`Email`}
                      id={`loginEmail`}
                      type={`email`}
                      value={email}
                      style={{ background: "rgba(185, 49, 96, 0.11)" }}
                      errorMessage={error.email && error.email}
                      onChange={(e) => {
                        setEmail(e.target.value);
                        if (!e.target.value) {
                          return setError({
                            ...error,
                            email: `Email Is Required`,
                          });
                        } else {
                          return setError({
                            ...error,
                            email: "",
                          });
                        }
                      }}
                    />
                  </div>

                  <div className="loginButton boxCenter mt-5">
                    <Button
                      newClass={`whiteFont ms-3`}
                      btnColor={`btnBlackPrime`}
                      style={{
                        borderRadius: "20px",
                        width: "170px",
                        height: "46px",
                      }}
                      btnName={`Send`}
                      onClick={handleSubmit}
                    />
                  </div>

                  <div className="d-flex align-items-center justify-content-center fw-bold my-3">
                    <a href="/" style={{ color: "#B9315F" }}>
                      Take me back to login!
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default ForgotPassword;
