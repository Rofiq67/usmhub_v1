import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrpDown extends StatelessWidget {
  final String labelDrp;
  final String? value;
  final List<String> listItem;
  final ValueChanged<String?> onChanged;

  const DrpDown({
    super.key,
    required this.labelDrp,
    required this.value,
    required this.listItem,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353,
      height: 60,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Color(0xFF3E4095)),
          borderRadius: BorderRadius.circular(29),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(
            labelDrp,
            style: GoogleFonts.poppins(
              color: const Color(0xFF757F90),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.32,
            ),
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color(0xFF3E4095),
          ),
          iconSize: 24,
          elevation: 16,
          isExpanded: true,
          style: const TextStyle(color: Colors.black),
          onChanged: onChanged,
          items: listItem.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: GoogleFonts.poppins(
                  color: const Color(0xff1c1c1c),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.32,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
