import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:usmhub_v1/features/pengaduan_page/data/models/aduan_models.dart';
import 'package:usmhub_v1/features/pengaduan_page/domains/controllers/aduan_controller.dart';
import 'package:usmhub_v1/features/pengaduan_page/presentations/pages/sent_pengaduan.dart';
import 'package:usmhub_v1/features/pengaduan_page/presentations/widgets/drpdown.dart';
import 'dart:io';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_storage/get_storage.dart';

class PostPengaduan extends StatefulWidget {
  const PostPengaduan({
    super.key,
  });

  @override
  _PostPengaduanState createState() => _PostPengaduanState();
}

class _PostPengaduanState extends State<PostPengaduan> {
  String? selectedCategory;
  List<String> kategoriAduan = ['Fasilitas', 'Kebijakan', 'Pelayanan'];

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
  File? _buktiPhoto;
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController keteranganController = TextEditingController();
  final AduanController aduanController = Get.put(AduanController());
  final String? token = GetStorage().read('token');

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _buktiPhoto = File(pickedFile.path);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _rating = 0;
  }

  bool isAllFieldsFilled() {
    // Cek apakah semua bidang telah terisi
    return selectedCategory != null &&
        selectedProgdi != null &&
        keteranganController.text.isNotEmpty &&
        _rating > 0 &&
        _buktiPhoto != null;
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
              const SizedBox(
                height: 32,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    const SizedBox(
                      height: 4,
                    ),
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
                    const SizedBox(
                      height: 8,
                    ),
                    DrpDown(
                      labelDrp: 'Kategori aduan',
                      value: selectedCategory,
                      listItem: kategoriAduan,
                      onChanged: onSelectCategory,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
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
                      labelDrp: 'Tujuan aduan',
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
                    const SizedBox(
                      height: 16,
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
                    const SizedBox(
                      height: 4,
                    ),
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
                    const SizedBox(
                      height: 8,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(double.maxFinite, 60),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(
                            width: 2, color: Color(0xff3E4095)),
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
                            _buktiPhoto != null
                                ? _buktiPhoto!.path.split('/').last
                                : 'Upload Bukti Foto',
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
                                final aduan = Aduan(
                                  id: 0, // Temporary ID, akan diset oleh server
                                  userId:
                                      0, // Temporary UserID, akan diset oleh server
                                  jenisPengaduan: selectedCategory!,
                                  programStudi: selectedProgdi!,
                                  keterangan: keteranganController.text,
                                  rating: _rating.toInt(),
                                  buktiPhoto: _buktiPhoto?.path,
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
                                                  'Konfirmasi Pengaduan',
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
                                                    'Kategori aduan',
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
                                                    aduan.jenisPengaduan,
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
                                                    aduan.programStudi,
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
                                                          aduan.keterangan,
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
                                                    aduan.rating.toString(),
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
                                              Text(
                                                'Bukti Photo',
                                                style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF757F90),
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
                                                    if (_buktiPhoto != null) {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            Dialog(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32),
                                                            child: SizedBox(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: 450,
                                                              child: PhotoView(
                                                                imageProvider:
                                                                    FileImage(
                                                                        _buktiPhoto!),
                                                                backgroundDecoration:
                                                                    const BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: _buktiPhoto != null
                                                        ? Image.file(
                                                            _buktiPhoto!,
                                                            fit: BoxFit.cover,
                                                          )
                                                        : const SizedBox
                                                            .shrink(), // Placeholder jika tidak ada foto
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
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
                                                        await aduanController
                                                            .createPengaduan(
                                                                aduan, token!);
                                                        Get.off(() =>
                                                            const SentPengaduan()); // Alihkan ke halaman SentPengaduan setelah berhasil
                                                      } catch (e) {
                                                        print(
                                                            'Error creating pengaduan: $e');
                                                        Get.snackbar(
                                                          'Error',
                                                          'Gagal membuat pengaduan',
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
