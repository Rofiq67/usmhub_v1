import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required this.hintTxt,
    required this.controller,
    required this.obscureTxt,
    required this.prefixIcon,
    this.suffixIcon,
    this.onTapSuffix,
    this.sizeTxt = 16,
    this.onTap,
    this.read = false,
  });

  final String hintTxt;
  final TextEditingController controller;
  final bool obscureTxt;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onTapSuffix;
  final double sizeTxt;
  final VoidCallback? onTap;
  final bool read;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: onTap != null,
        child: TextFormField(
          controller: controller,
          obscureText: obscureTxt,
          style: GoogleFonts.poppins(
            color: const Color(0xff3E4095),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: 0.32,
          ),
          readOnly: read,
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
              child: IconButton(
                onPressed: onTapSuffix,
                icon: Icon(
                  suffixIcon,
                  color: const Color(0xff3E4095),
                  size: 23,
                ),
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
