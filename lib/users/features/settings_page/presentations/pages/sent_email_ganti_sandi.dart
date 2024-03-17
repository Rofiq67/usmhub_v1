import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SentEmailGantiSandi extends StatefulWidget {
  const SentEmailGantiSandi({super.key});

  @override
  State<SentEmailGantiSandi> createState() => _SentEmailGantiSandiState();
}

class _SentEmailGantiSandiState extends State<SentEmailGantiSandi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 105,
        ),
        Center(child: SvgPicture.asset('assets/images/sent_email.svg')),
        const SizedBox(
          height: 32,
        ),
        const Text(
          'Email Ganti Kata Sandi Terkirim',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
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
            'abdurrofiq67@gmail.com',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF757F90),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.24,
            ),
          ),
        ),
        const SizedBox(
          height: 4,
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
          height: 32,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff3E4095),
            fixedSize: const Size(353, 60),
          ),
          child: const Text(
            'Kirim',
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
        TextButton(
          onPressed: () {},
          child: const Text(
            'Kirim pesan ulang',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF757F90),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.24,
            ),
          ),
        )
      ],
    ));
  }
}
