import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:photo_view/photo_view.dart';
import 'package:usmhub_v1/features/pengaduan_page/data/models/aduan_models.dart';
import 'package:usmhub_v1/features/pengaduan_page/domains/controllers/pengaduan_controller.dart';
import 'package:usmhub_v1/features/pengaduan_page/presentations/widgets/drpdown.dart';

class FormAduan extends StatelessWidget {
  final PengaduanController pengaduanController =
      Get.put(PengaduanController());
  final TextEditingController keteranganController = TextEditingController();

  FormAduan({super.key});

  void clearForm() {
    pengaduanController.selectedJenisPengaduan.value = '';
    pengaduanController.selectedProgramStudi.value = '';
    pengaduanController.rating.value = 0;
    pengaduanController.buktiPhoto.value = null;
    keteranganController.clear();
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
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
              Obx(
                () => DrpDown(
                  labelDrp: 'Jenis Pengaduan',
                  value:
                      pengaduanController.selectedJenisPengaduan.value.isEmpty
                          ? null
                          : pengaduanController.selectedJenisPengaduan.value,
                  listItem: const ['Fasilitas', 'Kebijakan', 'Pelayanan'],
                  onChanged: (newValue) {
                    pengaduanController.selectedJenisPengaduan.value =
                        newValue!;
                  },
                ),
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
              Obx(
                () => DrpDown(
                  labelDrp: 'Program Studi',
                  value: pengaduanController.selectedProgramStudi.value.isEmpty
                      ? null
                      : pengaduanController.selectedProgramStudi.value,
                  listItem: const [
                    'Dekan FTIK',
                    'Teknik Informatika',
                    'Sistem Informasi',
                    'Ilmu Komunikasi',
                    'Pariwisata'
                  ],
                  onChanged: (newValue) {
                    pengaduanController.selectedProgramStudi.value = newValue!;
                  },
                ),
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
              Obx(
                () => RatingBar.builder(
                  initialRating: pengaduanController.rating.value.toDouble(),
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
                    pengaduanController.rating.value = rating.toInt();
                  },
                ),
              ),
              const SizedBox(height: 16),
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
                  await pengaduanController.pickImage();
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
                              pengaduanController.buktiPhoto.value != null
                                  ? pengaduanController.buktiPhoto.value!.path
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
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
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
                                  pengaduanController
                                      .selectedJenisPengaduan.value,
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
                                  pengaduanController
                                      .selectedProgramStudi.value,
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
                                  pengaduanController.rating.value.toString(),
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
                                  if (pengaduanController.buktiPhoto.value !=
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
                                                  pengaduanController
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
                                  child: pengaduanController.buktiPhoto.value !=
                                          null
                                      ? Image.file(
                                          pengaduanController.buktiPhoto.value!,
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
                              Aduan newAduan = Aduan(
                                jenisPengaduan: pengaduanController
                                    .selectedJenisPengaduan.value,
                                programStudi: pengaduanController
                                    .selectedProgramStudi.value,
                                keterangan: keteranganController.text,
                                rating: pengaduanController.rating.value,
                                buktiPhoto:
                                    pengaduanController.buktiPhoto.value?.path,
                                id: 0,
                                userId: 0,
                                status: 'Belum Dibaca',
                                createdAt: DateTime.now(),
                                updatedAt: DateTime.now(),
                              );
                              pengaduanController.createPengaduan(newAduan);
                              clearForm();
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
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
