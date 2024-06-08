import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:photo_view/photo_view.dart';

class ConfirmPengaduan extends StatelessWidget {
  final String? kategoriPengaduan;
  final String? programStudi;
  final String? keterangan;
  final int? rating;
  final File? buktiPhoto;
  final VoidCallback onPrevious;
  final VoidCallback onSubmit;

  const ConfirmPengaduan({
    super.key,
    this.kategoriPengaduan,
    this.programStudi,
    this.keterangan,
    this.rating,
    this.buktiPhoto,
    required this.onPrevious,
    required this.onSubmit,
  });

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
        centerTitle: true,
        title: Text(
          'Konfirmasi Aduan',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: const Color(0xFF1C1C1C),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 0.32,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 353,
                height: 485,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Kategori Aduan',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF757F90),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.32,
                          ),
                        ),
                        Text(
                          kategoriPengaduan ?? '',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.32,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tujuan Wewenang',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF757F90),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.32,
                          ),
                        ),
                        Text(
                          programStudi ?? '',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.32,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Keterangan',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF757F90),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.32,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          keterangan ?? '',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF1C1C1C),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.32,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rating',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF757F90),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.32,
                          ),
                        ),
                        Text(
                          rating.toString(),
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 0,
                            letterSpacing: 0.32,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bukti Photo',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF757F90),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.32,
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            if (buktiPhoto != null) {
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(32),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 450,
                                      child: PhotoView(
                                        imageProvider: FileImage(buktiPhoto!),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: buktiPhoto != null
                                ? Image.file(buktiPhoto!)
                                : Container(), // or Placeholder() or something else
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Pastikan data sesuai apa yang Anda laporkan. Jika ada yang tidak sesuai, silakan kembali.',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.32,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: onPrevious,
                    child: const Text('Sebelumnya'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: onSubmit,
                    child: const Text('Kirim Pengaduan'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
