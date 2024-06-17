import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class NotifContainer extends StatefulWidget {
  final String judulNotif;
  final String statusNotif;
  final String waktuNotif;
  final IconData iconNtf;
  final Color clrIcon;
  final Color bgColor;

  const NotifContainer({
    required this.judulNotif,
    required this.statusNotif,
    required this.waktuNotif,
    required this.iconNtf,
    required this.clrIcon,
    required this.bgColor,
    super.key, // Perbaikan sintaks key di sini
  }); // Meneruskan key ke superclass

  @override
  State<NotifContainer> createState() => _NotifContainerState();
}

class _NotifContainerState extends State<NotifContainer> {
  bool isNotif = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isNotif) {
          setState(() {
            isNotif = true;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isNotif ? const Color(0xfff5f5f5) : Colors.white,
          border: const Border(
            bottom: BorderSide(
              width: 0.5,
              color: Color(0xFF757F90),
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: widget.bgColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  widget.iconNtf,
                  size: 28,
                  color: widget.clrIcon,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.judulNotif,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF757F90),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.24,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.statusNotif,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.32,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.waktuNotif,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF757F90),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
