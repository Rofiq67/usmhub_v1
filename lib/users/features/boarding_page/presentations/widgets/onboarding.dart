import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoarding extends StatelessWidget {
  final String imgBoarding;
  final String tltBoarding;
  final String subtltBorading;
  const OnBoarding(
      {required this.imgBoarding,
      required this.tltBoarding,
      required this.subtltBorading,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 153,
        ),
        SvgPicture.asset(imgBoarding),
        const SizedBox(
          height: 64,
        ),
        Text(
          tltBoarding,
          textAlign: TextAlign.center,
          style: const TextStyle(
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
        SizedBox(
          width: 353,
          child: Text(
            subtltBorading,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.32,
            ),
          ),
        ),
      ],
    );
  }
}
