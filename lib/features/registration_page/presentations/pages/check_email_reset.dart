import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class CheckEmailReset extends StatefulWidget {
  const CheckEmailReset({super.key});

  @override
  State<CheckEmailReset> createState() => _CheckEmailResetState();
}

class _CheckEmailResetState extends State<CheckEmailReset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF5F5F5),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.arrow_left),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              size: 32,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 64,
          ),
          Center(child: SvgPicture.asset('assets/images/email_reset.svg')),
          const SizedBox(
            height: 32,
          ),
          const Text(
            'Email Lupa Kata Sandi Terkirim',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: 0.32,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'abcdfg@gmail.com',
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
          const SizedBox(
            height: 8,
          ),
          const SizedBox(
            width: 352,
            child: Text(
              'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.28,
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
      ),
    );
  }
}
