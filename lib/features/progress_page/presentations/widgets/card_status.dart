import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardStatus extends StatelessWidget {
  final String judulSts;
  final String isiSts;
  final IconData icon;
  final Color iconColor;
  final Color bgIcon;
  const CardStatus(
      {required this.judulSts,
      required this.isiSts,
      super.key,
      required this.icon,
      required this.iconColor,
      required this.bgIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: 92,
      width: double.maxFinite,
      child: Row(
        children: [
          Container(
            width: 39,
            height: 39,
            decoration: ShapeDecoration(
              // color: const Color(0xFFBCBEF3),
              color: bgIcon,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Icon(
              icon,
              // iconCard,
              // color: Color(0xff3E4095),
              color: iconColor,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // 'Pengaduan ditindaklanjuti',
                judulSts,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 0.28,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 224,
                child: Text(
                  isiSts,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF757F90),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.24,
                  ),
                ),
              ),
              // SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
