import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usmhub_v1/main.dart';

class SentPengaduan extends StatefulWidget {
  const SentPengaduan({super.key});

  @override
  State<SentPengaduan> createState() => _SentPengaduanState();
}

class _SentPengaduanState extends State<SentPengaduan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 125,
            ),
            SvgPicture.asset('assets/images/sent_pengaduan.svg'),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Pengaduan Terkirim',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 0.48,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 353,
              child: Text(
                'Terima kasih atas aduan Anda. Kami akan segera memprosesnya.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.32,
                ),
              ),
            ),
            const SizedBox(
              height: 95,
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAll(() => const MainPage()); // Alihkan ke halaman utama
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff3E4095),
                fixedSize: const Size(353, 60),
              ),
              child: Text(
                'Selesai',
                style: GoogleFonts.poppins(
                  color: const Color(0xFFF9F9F9),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 0.32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
