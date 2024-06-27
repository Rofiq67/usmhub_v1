import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/aspirasi_page/data/models/aspirasi_models.dart';
import 'package:usmhub_v1/features/aspirasi_page/domains/controllers/aspirasi_controller.dart';
import 'package:usmhub_v1/features/pengaduan_page/presentations/widgets/drpdown.dart';

class FormAspirasi extends StatelessWidget {
  final AspirasiController aspirasiController = Get.put(AspirasiController());
  final TextEditingController keteranganController = TextEditingController();

  FormAspirasi({super.key});

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
          'Laporan Aspirasi',
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
              const SizedBox(
                height: 16,
              ),
              Text(
                'Kategori aspirasi',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 0.32,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Sesuaikan jenis aspirasi yang ingin anda laporkan.',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF757F90),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.28,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => DrpDown(
                  labelDrp: 'Jenis aspirasi',
                  value: aspirasiController.selectedJenisAspirasi.value.isEmpty
                      ? null
                      : aspirasiController.selectedJenisAspirasi.value,
                  listItem: const ['Fasilitas', 'Kebijakan', 'Pelayanan'],
                  onChanged: (newValue) {
                    aspirasiController.selectedJenisAspirasi.value = newValue!;
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Tujuan aspirasi',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 0.32,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
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
              const SizedBox(
                height: 8,
              ),
              Obx(() => DrpDown(
                    labelDrp: 'Program Studi',
                    value: aspirasiController.selectedProgramStudi.value.isEmpty
                        ? null
                        : aspirasiController.selectedProgramStudi.value,
                    listItem: const [
                      'Teknik Informatika',
                      'Sistem Informasi',
                      'Ilmu Komunikasi',
                      'Pariwisata'
                    ],
                    onChanged: (newValue) {
                      aspirasiController.selectedProgramStudi.value = newValue!;
                    },
                  )),
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
              const SizedBox(
                height: 4,
              ),
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
              const SizedBox(
                height: 8,
              ),
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
                  hintText: 'Keterangan aspirasi',
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
              ),
              const SizedBox(
                height: 8,
              ),
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
              const SizedBox(
                height: 4,
              ),
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
              const SizedBox(
                height: 8,
              ),
              Obx(() => RatingBar.builder(
                    initialRating: aspirasiController.rating.value.toDouble(),
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 30,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Iconsax.star1,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      aspirasiController.rating.value = rating.toInt();
                    },
                  )),
              const SizedBox(height: 16),
              Obx(
                () => ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Konfirmasi Aspirasi',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Kategori aspirasi',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF757F90),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      letterSpacing: 0.32,
                                    ),
                                  ),
                                  Text(
                                    aspirasiController
                                        .selectedJenisAspirasi.value,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tujuan aspirasi',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF757F90),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      letterSpacing: 0.32,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    aspirasiController
                                        .selectedProgramStudi.value,
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF1c1c1c),
                                      fontSize: 12,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    aspirasiController.rating.value.toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                      letterSpacing: 0.32,
                                    ),
                                  ),
                                ],
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
                                Aspirasi newAspirasi = Aspirasi(
                                  jenisAspirasi: aspirasiController
                                      .selectedJenisAspirasi.value,
                                  programStudi: aspirasiController
                                      .selectedProgramStudi.value,
                                  keterangan: keteranganController.text,
                                  rating: aspirasiController.rating.value,
                                  id: 0,
                                  userId: 0,
                                  status: 'Belum Dibaca',
                                  createdAt: DateTime.now(),
                                  updatedAt: DateTime.now(),
                                );
                                aspirasiController.createAspirasi(newAspirasi);
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
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
