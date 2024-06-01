import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usmhub_v1/features/aspirasi_page/presentations/widgets/drpdown.dart';

class FormAspirasi1 extends StatefulWidget {
  final TextEditingController controller;
  final String? selectedKategori;
  final ValueChanged<String?> onSelectedKategoriChanged;

  const FormAspirasi1({
    Key? key,
    required this.controller,
    this.selectedKategori,
    required this.onSelectedKategoriChanged,
  }) : super(key: key);

  @override
  State<FormAspirasi1> createState() => _FormAspirasi1State();
}

class _FormAspirasi1State extends State<FormAspirasi1> {
  List<String> jenisAspirasi = [
    'Fasilitas',
    'Kebijakan',
    'Pelayanan',
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
            SizedBox(
              width: 88,
              height: 88,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '01',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 64,
                      fontWeight: FontWeight.w600,
                      height: 0.01,
                      letterSpacing: 1.28,
                    ),
                  ),
                  const SizedBox(height: 29),
                  const Divider(
                    height: 20,
                    thickness: 4,
                    indent: 40,
                    endIndent: 10,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 352,
              child: Text(
                'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia.',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
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
              labelDrp: 'Kategori aspirasi',
              value: widget.selectedKategori,
              listItem: jenisAspirasi,
              onChanged: widget.onSelectedKategoriChanged,
            ),
          ],
        ),
      ),
    );
  }
}
