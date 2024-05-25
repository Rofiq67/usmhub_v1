import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SentAspirasi extends StatefulWidget {
  const SentAspirasi({super.key});

  @override
  State<SentAspirasi> createState() => _SentAspirasiState();
}

class _SentAspirasiState extends State<SentAspirasi> {
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
            const Text(
              'Aspirasi Terkirim',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 0.48,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              width: 353,
              child: Text(
                'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff3E4095),
                fixedSize: const Size(353, 60),
              ),
              child: const Text(
                'Selesai',
                style: TextStyle(
                  color: Color(0xFFF9F9F9),
                  fontSize: 16,
                  fontFamily: 'Poppins',
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
