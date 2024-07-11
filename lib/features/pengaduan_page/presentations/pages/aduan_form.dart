import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:usmhub_v1/features/pengaduan_page/data/models/aduan_models.dart';
import 'package:usmhub_v1/features/pengaduan_page/domains/controllers/aduan_controller.dart';
import 'package:usmhub_v1/features/pengaduan_page/presentations/widgets/drpdown.dart';
import 'package:usmhub_v1/features/registration_page/domains/controllers/auth.dart';

class AduanForm extends StatefulWidget {
  const AduanForm({super.key});

  @override
  _AduanFormState createState() => _AduanFormState();
}

class _AduanFormState extends State<AduanForm> {
  final AduanController aduanController = Get.find();
  final AuthController authController = Get.find();

  final TextEditingController keteranganController = TextEditingController();
  int rating = 0;
  bool isAnonymous = false;

  @override
  Widget build(BuildContext context) {
    void clearInputs() {
      setState(() {
        aduanController.selectedJenisPengaduan.value = '';
        aduanController.selectedProgramStudi.value = '';
        keteranganController.clear();
        rating = 0;
        isAnonymous = false;
        aduanController.buktiPhoto.value = null;
      });
    }

    void pickImage() async {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          aduanController.buktiPhoto.value = File(pickedFile.path);
        });
      }
    }

    void submitForm() async {
      if (aduanController.selectedJenisPengaduan.value.isEmpty ||
          aduanController.selectedProgramStudi.value.isEmpty ||
          keteranganController.text.isEmpty) {
        Get.snackbar('Error', 'Harap lengkapi semua kolom');
        return;
      }

      Aduan aduan = Aduan(
        id: 0,
        userId: 0,
        jenisPengaduan: aduanController.selectedJenisPengaduan.value,
        programStudi: aduanController.selectedProgramStudi.value,
        keterangan: keteranganController.text,
        rating: rating,
        buktiPhoto: aduanController.buktiPhoto.value?.path,
        status: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isAnonymous: isAnonymous,
      );

      bool success = await aduanController.createAduan(aduan);
      if (success) {
        // Jika pengaduan berhasil, ambil riwayat pengaduan terbaru
        aduanController.listRiwayatAduan();
        clearInputs();
      }
    }

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
          'Laporkan Aduan',
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'Aktifkan anonymous',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 0.32,
                ),
              ),
              SwitchListTile(
                title: Text(
                  isAnonymous
                      ? 'Anonymous'
                      : authController.userProfile['username'] ?? '',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.32,
                  ),
                ),
                value: isAnonymous,
                onChanged: (value) {
                  setState(() {
                    isAnonymous = value;
                  });
                },
              ),
              Text(
                'Kategori aduan',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 0.32,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Sesuaikan jenis aduan yang ingin anda laporkan.',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF757F90),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.28,
                ),
              ),
              const SizedBox(height: 8),
              DrpDown(
                labelDrp: 'Jenis Pengaduan',
                value: aduanController.selectedJenisPengaduan.value.isEmpty
                    ? null
                    : aduanController.selectedJenisPengaduan.value,
                listItem: const ['Fasilitas', 'Kebijakan', 'Pelayanan'],
                onChanged: (newValue) {
                  setState(() {
                    aduanController.selectedJenisPengaduan.value = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),
              Text(
                'Tujuan aduan',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 0.32,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Pilih tujuan sesuai yang bersangkutan.',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF757F90),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.28,
                ),
              ),
              const SizedBox(height: 8),
              DrpDown(
                labelDrp: 'Program Studi',
                value: aduanController.selectedProgramStudi.value.isEmpty
                    ? null
                    : aduanController.selectedProgramStudi.value,
                listItem: const [
                  'Dekan FTIK',
                  'Teknik Informatika',
                  'Sistem Informasi',
                  'Ilmu Komunikasi',
                  'Pariwisata'
                ],
                onChanged: (newValue) {
                  setState(() {
                    aduanController.selectedProgramStudi.value = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),
              Text(
                'Keterangan',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 0.32,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Isi keterangan dengan lengkap dan rinci.',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF757F90),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.28,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: keteranganController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3e4095), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(29)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Color(0xff3E4095)),
                    borderRadius: BorderRadius.all(Radius.circular(29)),
                  ),
                  filled: true,
                  fillColor: const Color(0xfff5f5f5),
                  prefixIconColor: const Color(0xff3E4095),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: Icon(Iconsax.direct_right),
                  ),
                  hintText: 'Keterangan aduan',
                  hintStyle: GoogleFonts.poppins(
                    color: const Color(0xFF757F90),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.32,
                  ),
                ),
                maxLines: 7,
                minLines: 1,
                maxLength: 250,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: 8),
              Text(
                'Rating',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 0.32,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Berilah penilaian tentang yang anda adukan',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF757F90),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.28,
                ),
              ),
              const SizedBox(height: 8),
              RatingBar.builder(
                initialRating: rating.toDouble(),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30.0,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (value) {
                  setState(() {
                    rating = value.toInt();
                  });
                },
              ),
              const SizedBox(height: 16.0),
              Text(
                'Bukti Photo',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 0.32,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Lampirkan bukti photo (jpg, jpeg, png)',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF757F90),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.28,
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(width: 2, color: Color(0xff3E4095)),
                ),
                onPressed: () async {
                  pickImage();
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        const Icon(
                          Iconsax.gallery,
                          color: Color(0xff3E4095),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Obx(
                            () => Text(
                              aduanController.buktiPhoto.value != null
                                  ? aduanController.buktiPhoto.value!.path
                                      .split('/')
                                      .last
                                  : 'Upload Bukti Foto',
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF757F90),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.32,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // submitForm();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          'Konfirmasi Pengaduan',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Laporkan sebagai',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFF757F90),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 0.32,
                                  ),
                                ),
                                Text(
                                  isAnonymous
                                      ? 'Anonymous'
                                      : authController
                                              .userProfile['username'] ??
                                          '', // Adjust as per your logic
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFF1c1c1c),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 0.32,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Kategori aduan',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFF757F90),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 0.32,
                                  ),
                                ),
                                Text(
                                  aduanController.selectedJenisPengaduan.value,
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFF1c1c1c),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 0.32,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Tujuan aduan',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFF757F90),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 0.32,
                                  ),
                                ),
                                Text(
                                  aduanController.selectedProgramStudi.value,
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFF1c1c1c),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 0.32,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
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
                                IntrinsicHeight(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: SingleChildScrollView(
                                      child: Text(
                                        keteranganController.text,
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF1C1C1C),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                          letterSpacing: 0.32,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                    letterSpacing: 0.32,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Bukti Photo:",
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF757F90),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.32,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 315,
                              height: 114,
                              child: GestureDetector(
                                onTap: () {
                                  if (aduanController.buktiPhoto.value !=
                                      null) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 450,
                                            child: PhotoView(
                                              imageProvider: FileImage(
                                                  aduanController
                                                      .buktiPhoto.value!),
                                              backgroundDecoration:
                                                  const BoxDecoration(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child:
                                      aduanController.buktiPhoto.value != null
                                          ? Image.file(
                                              aduanController.buktiPhoto.value!,
                                              fit: BoxFit.cover,
                                            )
                                          : const SizedBox.shrink(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF9F9F9),
                            ),
                            child: Text(
                              'Batal',
                              style: GoogleFonts.poppins(
                                color: const Color(0xff3E4095),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 0,
                                letterSpacing: 0.32,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              submitForm();
                              // clearForm();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff3E4095),
                            ),
                            child: Text(
                              'Kirim',
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
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff3E4095),
                  fixedSize: const Size(353, 60),
                ),
                child: Text(
                  'Konfirmasi',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFF9F9F9),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 0.32,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}
