import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CardUserChat extends StatelessWidget {
  final String jdlAduan;
  final String msgChat;
  final String timeChat;
  final String valueChat;
  final bool isNew;
  final VoidCallback onpressed;

  const CardUserChat({
    super.key,
    required this.jdlAduan,
    required this.msgChat,
    required this.timeChat,
    required this.valueChat,
    required this.isNew,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 82,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isNew ? Colors.white : Colors.transparent,
          border: const Border(
            bottom: BorderSide(
              width: 0.5,
              color: Color(0xFF757F90),
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: ShapeDecoration(
                color: const Color(0xFFBCBEF3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: const Center(
                child: Icon(
                  Iconsax.microphone,
                  size: 28,
                  color: Color(0xFF3E4095),
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: SizedBox(
                height: 62,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Aduan : ',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.0,
                            letterSpacing: 0.32,
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          jdlAduan,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.0,
                            letterSpacing: 0.32,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      msgChat,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF757F90),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.0,
                        letterSpacing: 0.20,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 32,
              height: 52,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      timeChat,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF757F90),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.0,
                        letterSpacing: 0.24,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFCE2424),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        valueChat,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.0,
                          letterSpacing: 0.24,
                        ),
                      ),
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
