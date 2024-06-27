import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:usmhub_v1/features/progress_page/presentations/pages/view_pdf.dart';

class BubbleFileAdmin extends StatelessWidget {
  final String filePath;
  final String fileName;
  final String txtBubble;
  final DateTime wktBubble;
  final String? firstName;
  final String? lastName;
  final String userRole;

  const BubbleFileAdmin({
    super.key,
    required this.filePath,
    required this.fileName,
    required this.txtBubble,
    required this.wktBubble,
    this.firstName,
    this.lastName,
    required this.userRole,
  });

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        _formatTime(wktBubble); // Format waktu menggunakan method _formatTime

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: GestureDetector(
        onTap: () {
          Get.to(() => ViewPdf(
              filePath: filePath)); // Navigasi ke ViewPdf dengan filePath
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (userRole == 'Superadmin' || userRole == 'Admin') ...[
              Text(
                '${firstName ?? ''} ${lastName ?? ''}',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF757F90),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
            ],
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6,
                maxHeight: MediaQuery.of(context).size.height * 0.3,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFF757F90),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Iconsax.attach_square),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text(
                      fileName,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFFF5F5F5),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.0, // Sesuaikan ketinggian
                        letterSpacing: 0.28,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Iconsax.arrow_down_2),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8,
                maxHeight: MediaQuery.of(context).size.height * 0.3,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFF757F90),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                txtBubble,
                style: GoogleFonts.poppins(
                  color: const Color(0xFFF5F5F5),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.0, // Sesuaikan ketinggian
                  letterSpacing: 0.28,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              formattedTime,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: const Color(0xFF757F90),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    DateTime now = DateTime.now();
    DateTime timeToShow = time.toLocal();

    if (now.difference(timeToShow).inHours < 24) {
      // Jika waktu adalah dalam 24 jam terakhir
      return DateFormat.jm('id_ID')
          .format(timeToShow); // Format dengan jam menit
    } else {
      // Jika waktu sudah lebih dari 24 jam
      initializeDateFormatting('id_ID'); // Inisialisasi locale Bahasa Indonesia
      return DateFormat('EEEE, dd MMMM yyyy HH:mm', 'id_ID').format(timeToShow);
      // Format dengan hari, tanggal, bulan, tahun, dan jam menit
    }
  }
}
