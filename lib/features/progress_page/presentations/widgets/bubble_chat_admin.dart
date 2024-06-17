import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class BubbleChatAdmin extends StatelessWidget {
  final String txtBubble;
  final DateTime wktBubble;
  const BubbleChatAdmin(
      {super.key, required this.txtBubble, required this.wktBubble});

  @override
  Widget build(BuildContext context) {
    String formattedTime = _formatTime(wktBubble);

    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                height: 0,
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
