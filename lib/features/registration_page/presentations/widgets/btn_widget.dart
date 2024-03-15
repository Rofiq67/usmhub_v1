import 'package:flutter/material.dart';

class BtnWidget extends StatefulWidget {
  
  const BtnWidget({super.key});

  @override
  State<BtnWidget> createState() => _BtnWidgetState();
}

class _BtnWidgetState extends State<BtnWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff3E4095),
        fixedSize: const Size(353, 60),
      ),
      child: const Text(
        'Daftar',
        style: TextStyle(
          color: Color(0xFFF9F9F9),
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          height: 0,
          letterSpacing: 0.32,
        ),
      ),
    );
  }
}
