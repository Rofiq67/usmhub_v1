import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class FormPengaduan4 extends StatefulWidget {
  final Function(File?) onImageSelected;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  const FormPengaduan4(
      {super.key,
      required this.onImageSelected,
      required this.onPrevious,
      required this.onNext});

  @override
  State<FormPengaduan4> createState() => _FormPengaduan4State();
}

class _FormPengaduan4State extends State<FormPengaduan4> {
  File? _buktiPhoto;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _buktiPhoto = File(pickedFile.path);
        widget.onImageSelected(_buktiPhoto);
      } else {
        print('No image selected.');
      }
    });
  }

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
            const SizedBox(height: 32),
            SizedBox(
              width: 88,
              height: 88,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '04',
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
                'Lampirkan bukti foto untuk sebagai bahan pertimbangan kami.',
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(double.maxFinite, 60),
                elevation: 0,
                side: const BorderSide(width: 2, color: Color(0xff3E4095)),
              ),
              onPressed: () async {
                _pickImage();
              },
              child: Row(
                children: [
                  const Icon(
                    Iconsax.gallery,
                    color: Color(0xff3E4095),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Upload Bukti Foto',
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
            ),
            const SizedBox(height: 16),
            _buktiPhoto != null
                ? Container(
                    width: double.maxFinite,
                    height: 200,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(_buktiPhoto!),
                    ),
                  )
                : Center(
                    child: Text(
                      '*Please select an image',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.24,
                      ),
                    ),
                  ),
            const SizedBox(height: 64),
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
                    if (_buktiPhoto != null) {
                      widget.onNext();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Silakan pilih bukti photo.'),
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
