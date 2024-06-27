import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/pengaduan_page/presentations/pages/pengaduan.dart';

class CardFitur extends StatelessWidget {
  final String nameFitur;
  final IconData iconFitur;
  final Color bgCard;
  final Color clrIcon;
  final Color bgIcon;
  final VoidCallback? onTap;
  const CardFitur(
      {super.key,
      required this.nameFitur,
      required this.iconFitur,
      required this.bgCard,
      required this.clrIcon,
      required this.bgIcon,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: 167,
        height: 54,
        decoration: BoxDecoration(
          // color: const Color(0xffEEEFF8),
          color: bgCard,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 39,
              height: 39,
              // padding: const EdgeInsets.only(left: 25),
              decoration: ShapeDecoration(
                // color: const Color(0xFFBCBEF3),
                color: bgIcon,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Icon(
                // Iconsax.microphone,
                iconFitur,
                color: clrIcon,
                // color: Color(0xff3E4095),
              ),
            ),
            Text(
              nameFitur,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
