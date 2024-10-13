// ignore_for_file: must_be_immutable

import 'package:era_shop/Controller/GetxController/login/user_login_controller.dart';
import 'package:era_shop/utiles/CoustomWidget/Sign_in_material/common_sign_in_button.dart';
import 'package:era_shop/utiles/CoustomWidget/Sign_in_material/dont_account.dart';
import 'package:era_shop/utiles/CoustomWidget/Sign_in_material/sign_in_back_button.dart';
import 'package:era_shop/utiles/CoustomWidget/Sign_in_material/sign_in_titles.dart';
import 'package:era_shop/utiles/Strings/strings.dart';
import 'package:era_shop/utiles/globle_veriables.dart';
import 'package:era_shop/utiles/Theme/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class EnterOtp extends StatelessWidget {
  UserLoginController userLoginController = Get.put(UserLoginController());
  EnterOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: Get.width / 20, right: Get.width / 20),
          child: SizedBox(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SignInBackButton(
                        onTaped: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height / 15,
                  ),
                  Obx(
                    () => Text(
                      St.enterOTP.tr,
                      style: isDark.value ? SignInTitleStyle.whiteTitle : SignInTitleStyle.blackTitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: SizedBox(
                      width: Get.width / 1.3,
                      height: 40,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: St.otpSubtitleEmail.tr,
                            style: GoogleFonts.plusJakartaSans(color: MyColors.darkGrey),
                            children: <TextSpan>[
                              TextSpan(
                                text: userLoginController.forgotPasswordEmailController.text,
                                style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w600, color: MyColors.black),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 45),
                    child: GetBuilder<UserLoginController>(
                      builder: (controller) => Pinput(
                        controller: userLoginController.verifyOtp,
                        // separator: const SizedBox(
                        //   width: 20,
                        // ),
                        keyboardType: TextInputType.number,
                        cursor: Container(
                          height: 23,
                          width: 2,
                          color: MyColors.primaryPink,
                        ),
                        submittedPinTheme: PinTheme(
                          height: 55,
                          width: 55,
                          textStyle: GoogleFonts.plusJakartaSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: MyColors.primaryPink,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            color: isDark.value ? MyColors.blackBackground : MyColors.white,
                          ),
                        ),
                        defaultPinTheme: PinTheme(
                          height: 55,
                          width: 55,
                          textStyle: GoogleFonts.plusJakartaSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: MyColors.primaryPink,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            color: isDark.value ? MyColors.blackBackground : MyColors.white,
                          ),
                        ),
                        followingPinTheme: PinTheme(
                          height: 55,
                          width: 55,
                          textStyle: GoogleFonts.plusJakartaSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: MyColors.primaryPink,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            color: isDark.value ? MyColors.blackBackground : MyColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CommonSignInButton(
                      onTaped: () {
                        userLoginController.enterOtpWhenEmpty();
                      },
                      text: St.continueText.tr),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: DoNotAccount(
                        onTaped: () {
                          userLoginController.resendOtp();
                        },
                        tapText: St.resendCodeText.tr,
                        text: St.donReceiveCode.tr),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
