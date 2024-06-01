import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/aspirasi_page/data/models/aspirasi_models.dart';
import 'package:usmhub_v1/features/aspirasi_page/domains/controllers/aspirasi_controller.dart';
import 'package:usmhub_v1/features/aspirasi_page/presentations/pages/sent_aspirasi.dart';
import 'package:usmhub_v1/features/pengaduan_page/presentations/widgets/drpdown.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_storage/get_storage.dart';

class AspirasiPost extends StatefulWidget {
  const AspirasiPost({
    super.key,
  });

  @override
  _AspirasiPostState createState() => _AspirasiPostState();
}

class _AspirasiPostState extends State<AspirasiPost> {
  String? selectedCategory;
  List<String> kategoriAspirasi = ['Fasilitas', 'Kebijakan', 'Pelayanan'];

  void onSelectCategory(String? category) {
    setState(() {
      selectedCategory = category;
    });
  }

  String? selectedProgdi;
  List<String> progdi = [
    'Teknik Informatika',
    'Sistem Informasi',
    'Ilmu Komunikasi',
    'Pariwisata'
  ];

  void onSelectedProgdi(String? programstudi) {
    setState(() {
      selectedProgdi = programstudi;
    });
  }

  late double _rating;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController keteranganController = TextEditingController();
  final AspirasiController aspirasiController = Get.put(AspirasiController());
  final String? token = GetStorage().read('token');

  @override
  void initState() {
    super.initState();
    _rating = 0;
  }

  bool isAllFieldsFilled() {
    // Check if all fields are filled
    return selectedCategory != null &&
        selectedProgdi != null &&
        keteranganController.text.isNotEmpty &&
        _rating > 0;
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
          'Aspirasi',
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
                height: 32,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    DrpDown(
                      labelDrp: 'Kategori aspirasi',
                      value: selectedCategory,
                      listItem: kategoriAspirasi,
                      onChanged: onSelectCategory,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
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
                    DrpDown(
                      labelDrp: 'Tujuan aspirasi',
                      value: selectedProgdi,
                      listItem: progdi,
                      onChanged: onSelectedProgdi,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
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
                          borderSide:
                              BorderSide(color: Color(0xff3e4095), width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(29)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff3E4095)),
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
                      height: 12,
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
                    RatingBar.builder(
                      initialRating: _rating,
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
                        setState(() {
                          _rating = rating;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Visibility(
                      visible: isAllFieldsFilled(),
                      child: BottomAppBar(
                        child: SizedBox(
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate() &&
                                  token != null) {
                                final aspirasi = Aspirasi(
                                  id: 0, // Temporary ID, akan diset oleh server
                                  userId:
                                      0, // Temporary UserID, akan diset oleh server
                                  jenisAspirasi: selectedCategory!,
                                  programStudi: selectedProgdi!,
                                  keterangan: keteranganController.text,
                                  rating: _rating.toInt(),
                                  status: 'Belum Dibaca', // Status default
                                );

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                      ),
                                      child: IntrinsicHeight(
                                        child: Container(
                                          width: 353,
                                          padding: const EdgeInsets.all(16),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Center(
                                                child: Text(
                                                  'Konfirmasi Aspirasi',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Kategori aspirasi',
                                                    style: GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFF757F90),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                      letterSpacing: 0.32,
                                                    ),
                                                  ),
                                                  Text(
                                                    aspirasi.jenisAspirasi,
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                      letterSpacing: 0.32,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Tujuan wewenang',
                                                    style: GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFF757F90),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                      letterSpacing: 0.32,
                                                    ),
                                                  ),
                                                  Text(
                                                    aspirasi.programStudi,
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 0,
                                                      letterSpacing: 0.24,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Keterangan',
                                                    style: GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFF757F90),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                      letterSpacing: 0.32,
                                                    ),
                                                  ),
                                                  IntrinsicHeight(
                                                    child: SizedBox(
                                                      width: double
                                                          .infinity, // Anda bisa mengatur tinggi sesuai kebutuhan
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Text(
                                                          aspirasi.keterangan,
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color: const Color(
                                                                0xFF1C1C1C),
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                            letterSpacing: 0.32,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Rating',
                                                    style: GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFF757F90),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                      letterSpacing: 0.32,
                                                    ),
                                                  ),
                                                  Text(
                                                    aspirasi.rating.toString(),
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 0,
                                                      letterSpacing: 0.32,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          const Color(
                                                              0xFFF9F9F9),
                                                    ),
                                                    child: Text(
                                                      'Batal',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: const Color(
                                                            0xff3E4095),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 0,
                                                        letterSpacing: 0.32,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 20),
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      try {
                                                        await aspirasiController
                                                            .createAspirasi(
                                                                aspirasi,
                                                                token!);
                                                        Get.off(() =>
                                                            const SentAspirasi()); // Alihkan ke halaman SentPengaduan setelah berhasil
                                                      } catch (e) {
                                                        print(
                                                            'Error creating aspirasi: $e');
                                                        // Menampilkan pesan error yang lebih rinci
                                                        Get.snackbar(
                                                          'Error',
                                                          'Gagal membuat aspirasi: $e',
                                                          snackPosition:
                                                              SnackPosition.TOP,
                                                        );
                                                      }
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          const Color(
                                                              0xff3E4095),
                                                    ),
                                                    child: Text(
                                                      'Kirim',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: const Color(
                                                            0xFFF9F9F9),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                      ),
                                    );
                                  },
                                );
                              } else if (token == null) {
                                Get.snackbar(
                                  'Error',
                                  'Token tidak ditemukan. Harap login kembali.',
                                  snackPosition: SnackPosition.TOP,
                                );
                              }
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
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
