import 'package:era_shop/utiles/CoustomWidget/App_theme_services/primary_buttons.dart';
import 'package:era_shop/utiles/CoustomWidget/App_theme_services/text_titles.dart';
import 'package:era_shop/utiles/CoustomWidget/App_theme_services/textfields.dart';
import 'package:era_shop/utiles/Strings/strings.dart';
import 'package:era_shop/utiles/app_circular.dart';
import 'package:era_shop/utiles/globle_veriables.dart';
import 'package:era_shop/utiles/Theme/my_colors.dart';
import 'package:era_shop/utiles/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Controller/GetxController/seller/seller_common_controller.dart';

// ignore: must_be_immutable
class SellerForgotPassword extends StatelessWidget {
  SellerForgotPassword({Key? key}) : super(key: key);

  // UserPasswordController userPasswordController = Get.put(UserPasswordController());
  SellerCommonController sellerCommonController = Get.put(SellerCommonController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              actions: [
                SizedBox(
                  width: Get.width,
                  height: double.maxFinite,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: PrimaryRoundButton(
                          onTaped: () {
                            Get.back();
                          },
                          icon: Icons.arrow_back_rounded,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: GeneralTitle(title: St.forgotPassword.tr),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
            child: PrimaryPinkButton(
                onTaped: () => isDemoSeller == true
                    ? displayToast(message: St.thisIsDemoApp.tr)
                    : sellerCommonController.forgotPasswordBySeller(),
                text: St.submit),
          ),
          body: SafeArea(
              child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: isDark.value ? MyColors.lightBlack : Colors.grey.shade200),
                      child: Row(
                        children: [
                          SizedBox(
                            height: double.maxFinite,
                            width: Get.width / 7,
                            child: Icon(Icons.info_rounded, color: Colors.grey.shade400, size: 27),
                          ),
                          Text(
                            St.profileForgotPasswordSubtitle.tr,
                            style: GoogleFonts.plusJakartaSans(fontSize: 12.5, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  PrimaryTextField(
                    controllerType: "SellerForgetPasswordEmail",
                    titleText: St.emailTextFieldTitle.tr,
                    hintText: St.emailTextFieldHintText.tr,
                  ),
                ],
              ),
            ),
          )),
        ),
        Obx(
          () => sellerCommonController.forgotPasswordLoading.value
              ? ScreenCircular.blackScreenCircular()
              : const SizedBox(),
        ),
      ],
    );
  }
}
