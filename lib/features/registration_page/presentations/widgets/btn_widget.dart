import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BtnWidget extends StatelessWidget {
  const BtnWidget(
      {super.key,
      required this.txtBtn,
      required this.clrBtn,
      required this.onPressed,
      required this.clrTxt});

  final String txtBtn;
  final Color clrBtn;
  final Color clrTxt;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: const BorderSide(
          color: Color(0xff3E4095),
          width: 2,
        ),
        backgroundColor: clrBtn,
        fixedSize: Size(MediaQuery.of(context).size.width, 60),
      ),
      child: Text(
        txtBtn,
        style: GoogleFonts.poppins(
          color: clrTxt,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 0,
          letterSpacing: 0.32,
        ),
      ),
    );
  }
}
