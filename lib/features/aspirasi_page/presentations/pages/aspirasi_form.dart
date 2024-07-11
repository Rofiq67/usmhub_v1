import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/aspirasi_page/data/models/aspirasi_models.dart';
import 'package:usmhub_v1/features/aspirasi_page/domains/controllers/aspirasi_controller.dart';
import 'package:usmhub_v1/features/pengaduan_page/presentations/widgets/drpdown.dart';
import 'package:usmhub_v1/features/registration_page/domains/controllers/auth.dart';

class AspirasiForm extends StatefulWidget {
  const AspirasiForm({super.key});

  @override
  _AspirasiFormState createState() => _AspirasiFormState();
}

class _AspirasiFormState extends State<AspirasiForm> {
  final AspirasiController aspirasiController = Get.find();
  final AuthController authController = Get.find();

  final TextEditingController keteranganController = TextEditingController();
  int rating = 0;
  bool isAnonymous = false;

  @override
  Widget build(BuildContext context) {
    void clearInputs() {
      setState(() {
        aspirasiController.selectedJenisAspirasi.value = '';
        aspirasiController.selectedProgramStudi.value = '';
        keteranganController.clear();
        rating = 0;
        isAnonymous = false;
      });
    }

    void submitForm() async {
      if (aspirasiController.selectedJenisAspirasi.value.isEmpty ||
          aspirasiController.selectedProgramStudi.value.isEmpty ||
          keteranganController.text.isEmpty) {
        Get.snackbar('Error', 'Harap lengkapi semua kolom');
        return;
      }

      Aspirasi aspirasi = Aspirasi(
        id: 0,
        userId: 0,
        jenisAspirasi: aspirasiController.selectedJenisAspirasi.value,
        programStudi: aspirasiController.selectedProgramStudi.value,
        keterangan: keteranganController.text,
        rating: rating,
        status: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isAnonymous: isAnonymous,
      );

      bool success = await aspirasiController.createAspirasi(aspirasi);
      if (success) {
        // Jika aspirasi berhasil, ambil riwayat aspirasi terbaru
        aspirasiController.fetchRiwayatAspirasi();
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
          'Laporkan Aspirasi NEW',
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
                'Kategori aspirasi',
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
                'Sesuaikan jenis aspirasi yang ingin anda laporkan.',
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
                labelDrp: 'Jenis aspirasi',
                value: aspirasiController.selectedJenisAspirasi.value.isEmpty
                    ? null
                    : aspirasiController.selectedJenisAspirasi.value,
                listItem: const ['Fasilitas', 'Kebijakan', 'Pelayanan'],
                onChanged: (newValue) {
                  setState(() {
                    aspirasiController.selectedJenisAspirasi.value = newValue!;
                  });
                },
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
                value: aspirasiController.selectedProgramStudi.value.isEmpty
                    ? null
                    : aspirasiController.selectedProgramStudi.value,
                listItem: const [
                  'Dekan FTIK',
                  'Teknik Informatika',
                  'Sistem Informasi',
                  'Ilmu Komunikasi',
                  'Pariwisata'
                ],
                onChanged: (newValue) {
                  setState(() {
                    aspirasiController.selectedProgramStudi.value = newValue!;
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
                'Berilah penilaian tentang yang anda aspirasi',
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
              ElevatedButton(
                onPressed: () {
                  // submitForm();
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                Text(
                                  aspirasiController.selectedProgramStudi.value,
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
