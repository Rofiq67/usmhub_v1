import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/aspirasi_page/presentations/pages/aspirasi_form.dart';

class AspirasiPage extends StatefulWidget {
  const AspirasiPage({super.key});

  @override
  State<AspirasiPage> createState() => _AspirasiPageState();
}

class _AspirasiPageState extends State<AspirasiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xfff5f5f5),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(Iconsax.arrow_left),
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
              'Petunjuk Aspirasi',
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
                'Pengaduan yang baik akan diproses dengan baik, perhatikan petunjuk pengaduan berikut ini',
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
              height: 32,
            ),
            SizedBox(
              width: 352,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2, // jumlah item dalam list
                itemBuilder: (BuildContext context, int index) {
                  int itemNumber = index + 1; // nomor item dimulai dari 1
                  String itemText = '';
                  switch (index) {
                    case 0:
                      itemText =
                          'Tulis aspirasi, harapan, cita-cita, atau keinginan untuk mencapai sesuatu yang lebih baik.';
                      break;
                    case 1:
                      itemText =
                          'Verifikasi, dalam 3 hari laporan anda akan diverifikasi dan diteruskan kepada yang berwenang.';
                      break;
                    default:
                      itemText = '';
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$itemNumber. ',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: 0.32,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            itemText,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 0.32,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const AspirasiForm());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff3E4095),
                fixedSize: const Size(353, 60),
              ),
              child: Text(
                'Mulai',
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
