import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usmhub_v1/features/aspirasi_page/presentations/widgets/drpdown.dart';

class FormAspirasi2 extends StatefulWidget {
  final TextEditingController controller;
  final String? selectedProgdi;
  final ValueChanged<String?> onSelectedProgdiChanged;

  const FormAspirasi2({
    Key? key,
    required this.controller,
    this.selectedProgdi,
    required this.onSelectedProgdiChanged,
  }) : super(key: key);

  @override
  State<FormAspirasi2> createState() => _FormAspirasi2State();
}

class _FormAspirasi2State extends State<FormAspirasi2> {
  List<String> progdi = [
    'Teknik Informatika',
    'Sistem Informasi',
    'Ilmu Komunikasi',
    'Pariwisata'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            const SizedBox(
              width: 88,
              height: 88,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '02',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 64,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.01,
                      letterSpacing: 1.28,
                    ),
                  ),
                  SizedBox(height: 29),
                  Divider(
                    height: 20,
                    thickness: 4,
                    indent: 40,
                    endIndent: 10,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 352,
              child: Text(
                'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.32,
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            DrpDown(
              labelDrp: 'Tujuan aduan',
              value: widget.selectedProgdi,
              listItem: progdi,
              onChanged: widget.onSelectedProgdiChanged,
            ),
          ],
        ),
      ),
    );
  }
}
