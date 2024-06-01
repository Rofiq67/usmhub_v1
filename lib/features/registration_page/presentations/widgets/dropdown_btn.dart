import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropdownBtn extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> items;
  final void Function(String?) onChanged;
  final IconData prefixIcon;

  const DropdownBtn({
    Key? key,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: value,
      hint: Text(hint,
          style: GoogleFonts.poppins(
            color: const Color(0xFF757F90),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: 0.32,
          )),
      style: GoogleFonts.poppins(
        color: const Color(0xff3E4095),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 0,
        letterSpacing: 0.32,
      ),
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Icon(
            prefixIcon,
            color: const Color(0xff3E4095),
            size: 23,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Color(0xff3E4095)),
          borderRadius: BorderRadius.all(Radius.circular(29)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Color(0xff3E4095)),
          borderRadius: BorderRadius.all(Radius.circular(29)),
        ),
      ),
    );
  }
}
