import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/pengaduan_page/domains/controllers/aduan_controller.dart';
import 'form_pengaduan2.dart';

class FormPengaduan1 extends StatefulWidget {
  final Function(String) onSelectCategory;
  final VoidCallback onNext;
  const FormPengaduan1({
    super.key,
    required this.onSelectCategory,
    required this.onNext,
  });

  @override
  State<FormPengaduan1> createState() => _FormPengaduan1State();
}

class _FormPengaduan1State extends State<FormPengaduan1> {
  List<String> kategoriAduan = [
    "Fasilitas",
    "Kebijakan",
    "Pelayanan",
  ];

  String? selectedCategory;

  final AduanController aduanController = Get.put(AduanController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              SizedBox(
                width: 88,
                height: 88,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                  'Pilihlah kategori pengaduan, berdasarkan apa yang akan Anda laporkan.',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.32,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Form(
                key: _formKey,
                child: Container(
                  width: 353,
                  height: 60,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 2, color: Color(0xFF3E4095)),
                      borderRadius: BorderRadius.circular(29),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedCategory,
                      hint: const Text(
                        'Pilih kategori aduan',
                        style: TextStyle(
                          color: Color(0xFF757F90),
                          fontSize: 16,
                          fontFamily: 'Poppins',
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
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategory = newValue!;
                          widget.onSelectCategory(newValue);
                        });
                      },
                      items: kategoriAduan
                          .map<DropdownMenuItem<String>>((String value) {
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
              ),
              const SizedBox(height: 210),
              ElevatedButton(
                onPressed: () {
                  if (selectedCategory != null) {
                    widget.onNext();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Silakan pilih kategori pengaduan.'),
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
        ),
      ),
    );
  }
}
