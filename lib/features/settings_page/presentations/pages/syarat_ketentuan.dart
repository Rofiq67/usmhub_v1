import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class SyaratKetentuan extends StatefulWidget {
  const SyaratKetentuan({super.key});

  @override
  State<SyaratKetentuan> createState() => _SyaratKetentuanState();
}

class _SyaratKetentuanState extends State<SyaratKetentuan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Iconsax.arrow_left)),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffF5F5F5),
        scrolledUnderElevation: 0,
        title: Text(
          'Syarat dan Ketentuan',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: const Color(0xFF1C1C1C),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 0.32,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            Text(
              'Syarat dan Ketentuan',
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
              width: 352,
              child: Text(
                'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia.',
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
              height: 16,
            ),
            SizedBox(
              width: 352,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '1. Tulis laporan,',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                    ),
                    TextSpan(
                      text: ' ',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                    ),
                    TextSpan(
                      text: 'atu keluhan anda dengan jelas dan lengkap.\n',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.64,
                      ),
                    ),
                    TextSpan(
                      text: '2. Verifikasi,',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' dalam 3 hari laporan anda akan diverifikasi dan diteruskan kepada yang berwenang.\n',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                    ),
                    TextSpan(
                      text: '3. Proses tindaklanjut,',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' admin akan menindaklanjuti dan membalas laporan anda.\n',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                    ),
                    TextSpan(
                      text: '4. Beri tanggapan,',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' anda dapat menanggapo kembali balasan yang diberikan oleh admin.\n',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                    ),
                    TextSpan(
                      text: 'Selesai',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                    ),
                    TextSpan(
                      text:
                          ', laporan anda akan terus ditindaklanjuti hingga terselesaikan.',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
