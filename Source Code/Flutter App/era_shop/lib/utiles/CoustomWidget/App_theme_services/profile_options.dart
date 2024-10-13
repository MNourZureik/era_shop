import 'package:era_shop/utiles/globle_veriables.dart';
import 'package:era_shop/utiles/Theme/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileOptions extends StatelessWidget {
  final onTap;
  final image;
  final text;
  const ProfileOptions({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        color: Colors.transparent,
        // color: Colors.purple.shade100,
        child: Row(
          children: [
            Obx(
              () => Image(
                color: isDark.value ? Colors.white : Colors.black,
                image: image,
                height: 22,
                width: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                text,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 15.7,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: MyColors.mediumGrey,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
