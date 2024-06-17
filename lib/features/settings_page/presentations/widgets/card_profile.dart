import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardProfile extends StatelessWidget {
  final String txtCard;
  final IconData iconData;
  const CardProfile({super.key, required this.txtCard, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: 332,
      height: 51,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData),
          const SizedBox(
            width: 20,
          ),
          Text(
            txtCard,
            style: GoogleFonts.poppins(
              color: const Color(0xFF1C1C1C),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.32,
            ),
          ),
        ],
      ),
    );
  }
}
