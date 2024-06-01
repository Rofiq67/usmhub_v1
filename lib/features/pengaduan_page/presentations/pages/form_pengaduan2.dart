import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/pengaduan_page/data/models/aduan_models.dart';
import 'package:usmhub_v1/features/pengaduan_page/domains/controllers/aduan_controller.dart';
import 'package:usmhub_v1/features/pengaduan_page/presentations/pages/form_pengaduan3.dart';

class FormPengaduan2 extends StatefulWidget {
  final Function(String) onSelectProgramStudi;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  const FormPengaduan2({
    super.key,
    required this.onSelectProgramStudi,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  State<FormPengaduan2> createState() => _FormPengaduan2State();
}

class _FormPengaduan2State extends State<FormPengaduan2> {
  String? selectedProgramStudi;

  List<String> listProgdi = [
    "Teknik Informatika",
    "Sistem Informasi",
    "Ilmu Komunikasi",
    "Pariwisata",
  ];

  // final AduanController _aduanController = AduanController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xfff5f5f5),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Iconsax.arrow_left),
          ),
        ),
      ),
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '02',
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
                'Pilih tujuan wewenang yang Anda serahkan atas laporan aduan.',
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
            Container(
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
                  value: selectedProgramStudi,
                  hint: Row(
                    children: [
                      const Icon(
                        Iconsax.signpost,
                        color: Color(0xFF3E4095),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Pilih program studi',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF757F90),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.32,
                        ),
                      ),
                    ],
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedProgramStudi = newValue!;
                      widget.onSelectProgramStudi(newValue);
                    });
                  },
                  items:
                      listProgdi.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          color: Color(0xff1c1c1c),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.32,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: widget.onPrevious,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3E4095),
                    fixedSize: const Size(353, 60),
                  ),
                  child: Text(
                    'Kembalii',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFF9F9F9),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: 0.32,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedProgramStudi != null) {
                      widget.onNext();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Silakan pilih program studi.'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3E4095),
                    fixedSize: const Size(353, 60),
                  ),
                  child: Text(
                    'Selanjutnya',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFF9F9F9),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: 0.32,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
