import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditCardProfile extends StatelessWidget {
  final String label;
  final IconData iconData;
  final TextEditingController controller;
  final bool? readOnly;

  const EditCardProfile({
    super.key,
    required this.label,
    required this.iconData,
    required this.controller,
    this.readOnly = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        enabled: readOnly,
        controller: controller,
        showCursor: true,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff1c1c1c),
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          labelText: label,
          prefixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          labelStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: 0.28,
          ),
        ),
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 0,
          letterSpacing: 0.28,
        ),
      ),
    );
  }
}
