import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardInfoAduanChat extends StatelessWidget {
  final String kategoriAduan;
  final String tujuanAduan;
  final String dateAduan;
  final String imgAduan;
  final VoidCallback onpressed;
  const CardInfoAduanChat({
    super.key,
    required this.kategoriAduan,
    required this.tujuanAduan,
    required this.dateAduan,
    required this.imgAduan,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        width: 357,
        height: 146,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.only(bottom: 16),
        clipBehavior: Clip.antiAlias,
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Pengaduan',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF757F90),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.28,
                      ),
                    ),
                    const SizedBox(width: 43),
                    Text(
                      'klik detail',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF757F90),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.28,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 210,
                  child: Wrap(
                    children: [
                      Text(
                        kategoriAduan,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height:
                              1.5, // Mengubah height untuk memberi jarak antar baris
                          letterSpacing: 0.32,
                        ),
                      ),
                      Text(
                        ' - ',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          letterSpacing: 0.32,
                        ),
                      ),
                      Text(
                        tujuanAduan,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          letterSpacing: 0.32,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '1 Maret 2024',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF757F90),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.28,
                      ),
                    ),
                    const SizedBox(width: 43),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 9,
                          height: 9,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF20EA00),
                            shape: OvalBorder(),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Aktif',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF1C1C1C),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.28,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 114,
              height: 114,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/parkir_usm.png',
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
