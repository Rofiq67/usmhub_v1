import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required this.hintTxt,
    required this.controller,
    required this.obsureTxt,
    required this.prefixIcon,
    this.suffixIcon,
    this.sizeTxt = 16,
    this.onTap,
  });

  final String hintTxt;
  final TextEditingController controller;
  final bool obsureTxt;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final double sizeTxt;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: onTap != null,
        child: TextFormField(
          controller: controller,
          obscureText: obsureTxt,
          style: GoogleFonts.poppins(
            color: const Color(0xff3E4095),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: 0.32,
          ),
          decoration: InputDecoration(
            prefixIconColor: const Color(0xff3E4095),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Icon(
                prefixIcon,
                color: const Color(0xff3E4095),
                size: 23,
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 23),
              child: Icon(
                suffixIcon,
                color: const Color(0xff3E4095),
                size: 23,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xff3E4095)),
                borderRadius: BorderRadius.all(Radius.circular(29))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xff3E4095)),
                borderRadius: BorderRadius.all(Radius.circular(29))),
            hintText: hintTxt,
            hintStyle: GoogleFonts.poppins(
              color: const Color(0xFF757F90),
              fontSize: sizeTxt,
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.32,
            ),
          ),
        ),
      ),
    );
  }
}
