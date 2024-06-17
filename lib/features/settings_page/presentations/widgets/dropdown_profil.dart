import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropdownProfil extends StatelessWidget {
  // final String hint;
  // final String? value;
  // final List<String> items;
  // final void Function(String?) onChanged;
  // final IconData prefixIcon;
  final String label;
  final IconData iconData;
  final String? value;
  final List<String> items;
  final void Function(String?) onChanged;

  const DropdownProfil({
    super.key,
    required this.label,
    required this.iconData,
    this.value,
    required this.items,
    required this.onChanged,
    // required this.hint,
    // required this.value,
    // required this.items,
    // required this.onChanged,
    // required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField2<String>(
        value: value,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
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
    //
    // Container(
    //   margin: const EdgeInsets.only(bottom: 8, top: 8),
    //   padding: const EdgeInsets.symmetric(
    //     vertical: 8.0,
    //   ),
    //   height: 50,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(16.0),
    //     border: Border.all(color: const Color(0xff3E4095), width: 1),
    //   ),
    //   child: DropdownButtonFormField2<String>(
    //     value: value,
    //     hint: Text(
    //       hint,
    //       style: GoogleFonts.poppins(
    //         color: const Color(0xFF757F90),
    //         fontSize: 16,
    //         fontWeight: FontWeight.w400,
    //         height: 0,
    //         letterSpacing: 0.32,
    //       ),
    //     ),
    //     style: GoogleFonts.poppins(
    //       color: const Color(0xff3E4095),
    //       fontSize: 16,
    //       fontWeight: FontWeight.w400,
    //       height: 0,
    //       letterSpacing: 0.32,
    //     ),
    //     items: items.map((String item) {
    //       return DropdownMenuItem<String>(
    //         value: item,
    //         child: Text(item),
    //       );
    //     }).toList(),
    //     onChanged: onChanged,
    //     decoration: InputDecoration(
    //       contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    //       prefixIcon: Padding(
    //         padding: const EdgeInsets.only(left: 20, right: 10),
    //         child: Icon(
    //           prefixIcon,
    //           color: const Color(0xff3E4095),
    //           size: 23,
    //         ),
    //       ),
    //       border: InputBorder.none,
    //       focusedBorder: OutlineInputBorder(
    //         borderSide: BorderSide.none,
    //         borderRadius: BorderRadius.circular(16.0),
    //       ),
    //       enabledBorder: OutlineInputBorder(
    //         borderSide: BorderSide.none,
    //         borderRadius: BorderRadius.circular(16.0),
    //       ),
    //     ),
    //   ),
    // );
  }
}
