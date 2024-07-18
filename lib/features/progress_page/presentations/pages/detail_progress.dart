// ignore_for_file: unused_element

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:usmhub_v1/controllers/getfile_controller.dart';
import 'package:usmhub_v1/features/aspirasi_page/data/models/aspirasi_models.dart';
import 'package:usmhub_v1/features/pengaduan_page/data/models/aduan_models.dart';
import 'package:usmhub_v1/features/progress_page/domains/controllers/progress_controller.dart';
import 'package:usmhub_v1/features/progress_page/presentations/pages/komentar_page.dart';
import 'package:usmhub_v1/features/progress_page/presentations/widgets/card_status.dart';
import 'package:usmhub_v1/features/registration_page/domains/controllers/auth.dart';

class DetailProgress extends StatefulWidget {
  final dynamic item;

  const DetailProgress({super.key, required this.item});

  @override
  State<DetailProgress> createState() => _DetailProgressState();
}

class _DetailProgressState extends State<DetailProgress> {
  final ProgressController progressController = Get.put(ProgressController());
  final AuthController authController = Get.find();
  final GetfileController getFileController = Get.find();

  @override
  void initState() {
    super.initState();
    if (widget.item is Aduan) {
      progressController.fetchHistoryForward(widget.item.id);
    }
  }

  Future<void> _refresh() async {
    if (widget.item is Aduan) {
      await progressController.fetchHistoryForward(widget.item.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color getStatusColor(String status) {
      switch (status) {
        case 'Selesai':
          return Colors.grey; // Warna abu-abu untuk status Selesai
        case 'Telah diterima':
          return Colors.grey; // Warna abu-abu untuk status Telah diterima
        case 'Ditolak':
          return Colors.red; // Warna merah untuk status Ditolak
        default:
          return const Color(0xFF20EA00);
      }
    }

    String getStatusText(String status) {
      switch (status) {
        case 'Selesai':
        case 'Telah diterima':
          return 'Selesai'; // Tekst "Selesai" untuk status Selesai dan Telah diterima
        case 'Ditolak':
          return 'Ditolak'; // Teks "Ditolak" untuk status Ditolak
        default:
          return 'Aktif'; // Teks "aktif" untuk status lainnya
      }
    }

    String jenis = widget.item is Aduan
        ? widget.item.jenisPengaduan
        : (widget.item as Aspirasi).jenisAspirasi;
    String status = widget.item is Aduan
        ? widget.item.status
        : (widget.item as Aspirasi).status;
    DateTime createdAt = widget.item is Aduan
        ? widget.item.createdAt
        : (widget.item as Aspirasi).createdAt;
    bool isAnon = widget.item is Aduan
        ? widget.item.isAnonymous
        : (widget.item as Aspirasi).isAnonymous;

    Color iconColor = widget.item is Aduan
        ? const Color(0xff3E4095)
        : const Color(0xffff8800);
    Color bgColor = widget.item is Aduan
        ? const Color(0xFFBCBEF3)
        : const Color(0xffFEFCB9);

    List<CardStatus> cardStatuses = [];

    if (status == 'Selesai') {
      cardStatuses.add(
        CardStatus(
          judulSts: 'Pengaduan Selesai',
          isiSts: 'Laporan pengaduan telah selesai ditangani.',
          icon: Iconsax.tick_circle,
          iconColor: iconColor,
          bgIcon: bgColor,
        ),
      );
    }

    if (status == 'Telah diterima') {
      cardStatuses.addAll([
        CardStatus(
          judulSts: 'Aspirasi Telah Diterima',
          isiSts: 'Laporan aspirasi telah diterima.',
          icon: Iconsax.tick_circle,
          iconColor: iconColor,
          bgIcon: bgColor,
        ),
        CardStatus(
          judulSts: 'Aspirasi telah diverifikasi',
          isiSts: 'Laporan aspirasi berhasil terverifikasi.',
          icon: Iconsax.verify,
          iconColor: iconColor,
          bgIcon: bgColor,
        ),
      ]);
    }

    if (status == 'Ditolak') {
      cardStatuses.addAll([
        CardStatus(
          judulSts: widget.item is Aduan
              ? 'Pengaduan telah ditolak'
              : 'Aspirasi telah ditolak',
          isiSts: widget.item is Aduan
              ? 'Laporan aduan gagal verifikasi.'
              : 'Laporan aspirasi gagal verifikasi.',
          icon: Iconsax.verify,
          iconColor: iconColor,
          bgIcon: bgColor,
        ),
        CardStatus(
          judulSts: widget.item is Aduan
              ? 'Pengaduan telah diverifikasi'
              : 'Aspirasi telah diverifikasi',
          isiSts: widget.item is Aduan
              ? 'Laporan aduan berhasil terverifikasi.'
              : 'Laporan aspirasi berhasil terverifikasi.',
          icon: Iconsax.verify,
          iconColor: iconColor,
          bgIcon: bgColor,
        ),
      ]);
    }

    if (status == 'Ditindaklanjuti' || status == 'Selesai') {
      cardStatuses.addAll([
        CardStatus(
          judulSts: 'Pengaduan ditindaklanjuti',
          isiSts:
              'Laporan ditindaklanjuti. Jika ada pertanyaan? buka komentar.',
          icon: Iconsax.direct_right,
          iconColor: iconColor,
          bgIcon: bgColor,
        ),
        CardStatus(
          judulSts: 'Pengaduan telah diverifikasi',
          isiSts: 'Laporan pengaduan berhasil terverifikasi.',
          icon: Iconsax.verify,
          iconColor: iconColor,
          bgIcon: bgColor,
        ),
      ]);
    }

    if (status == 'Belum Dibaca' ||
        status == 'Ditindaklanjuti' ||
        status == 'Selesai' ||
        status == 'Telah diterima' ||
        status == 'Ditolak') {
      cardStatuses.add(
        CardStatus(
          judulSts: widget.item is Aduan
              ? 'Menunggu Verifikasi Pengaduan'
              : 'Menunggu Verifikasi Aspirasi',
          isiSts: widget.item is Aduan
              ? 'Laporan sedang diverifikasi dan akan segera diproses.'
              : 'Laporan sedang diverifikasi dan akan segera diproses.',
          icon: Iconsax.clock,
          iconColor: iconColor,
          bgIcon: bgColor,
        ),
      );
    }

    //
    // ignore: unused_local_variable
    late int aduanId = 0; // Default value

    @override
    void initState() {
      super.initState();
      if (widget.item != null && widget.item is Aduan) {
        aduanId = widget.item.id;
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.item is Aduan ? 'Detail Pengaduan' : 'Detail Aspirasi',
          style: GoogleFonts.poppins(
            color: const Color(0xFF1C1C1C),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 0.32,
          ),
        ),
        backgroundColor: const Color(0xffF5F5F5),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              // Kembali ke halaman sebelumnya
              Navigator.of(context).pop();
            },
            icon: const Icon(Iconsax.arrow_left),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: SizedBox(
              height: 800,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),
                      InkWell(
                        onTap: () {
                          // beri showdialog disini
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                child: Container(
                                  width: 353,
                                  height: widget.item is Aduan
                                      ? MediaQuery.of(context).size.height * 0.7
                                      : MediaQuery.of(context).size.height *
                                          0.4, // Menggunakan 70% atau 40% dari tinggi layar, sesuaikan sesuai kebutuhan

                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 32),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            widget.item is Aduan
                                                ? 'Kategori aduan'
                                                : 'Kategori aspirasi',
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xFF757F90),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.32,
                                            ),
                                          ),
                                          Text(
                                            jenis,
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.32,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Laporkan sebagai',
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xFF757F90),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.32,
                                            ),
                                          ),
                                          Text(
                                            isAnon
                                                ? 'Anonymous'
                                                : authController.userProfile[
                                                        'username'] ??
                                                    '',
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.32,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Tujuan Wewenang',
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xFF757F90),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.32,
                                            ),
                                          ),
                                          Text(
                                            widget.item.programStudi,
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.24,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Keterangan',
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xFF757F90),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.32,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          IntrinsicHeight(
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                widget.item.keterangan,
                                                style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF1C1C1C),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.32,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Rating',
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xFF757F90),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.32,
                                            ),
                                          ),
                                          Text(
                                            widget.item.rating.toString(),
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.32,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      //
                                      widget.item is Aduan &&
                                              widget.item.buktiPhoto != null
                                          ? Expanded(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Bukti Photo',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: const Color(
                                                            0xFF757F90),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        letterSpacing: 0.32,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 114,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: FutureBuilder<
                                                            Uint8List?>(
                                                          future: getFileController
                                                              .getImage(widget
                                                                  .item
                                                                  .buktiPhoto),
                                                          builder: (context,
                                                              AsyncSnapshot<
                                                                      Uint8List?>
                                                                  snapshot) {
                                                            if (snapshot
                                                                    .connectionState ==
                                                                ConnectionState
                                                                    .waiting) {
                                                              return const Center(
                                                                  child:
                                                                      CircularProgressIndicator());
                                                            }
                                                            if (snapshot
                                                                .hasError) {
                                                              return Center(
                                                                  child: Text(
                                                                      'Error: ${snapshot.error}'));
                                                            }
                                                            if (snapshot
                                                                    .hasData &&
                                                                snapshot.data !=
                                                                    null) {
                                                              return Image
                                                                  .memory(
                                                                snapshot.data!,
                                                                fit: BoxFit
                                                                    .cover,
                                                              );
                                                            } else {
                                                              return Image
                                                                  .asset(
                                                                'assets/images/parkir_usm.png',
                                                                fit: BoxFit
                                                                    .cover,
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 146,
                          padding: const EdgeInsets.all(16),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        jenis,
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF757F90),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                          letterSpacing: 0.28,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 42,
                                      ),
                                      Text(
                                        'Klik detail',
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF757F90),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                          letterSpacing: 0.28,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 194,
                                    child: Text(
                                      status,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                        letterSpacing: 0.32,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        DateFormat('dd MMM yyyy')
                                            .format(createdAt),
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF757F90),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                          letterSpacing: 0.28,
                                        ),
                                      ),
                                      const SizedBox(width: 40),
                                      Row(
                                        children: [
                                          Container(
                                            width: 9,
                                            height: 9,
                                            decoration: BoxDecoration(
                                              color: getStatusColor(
                                                  status), // Memanggil fungsi getStatusColor
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            getStatusText(
                                                status), // Memanggil fungsi getStatusText
                                            style: GoogleFonts.poppins(
                                              color: getStatusColor(
                                                  status), // Memanggil fungsi getStatusColor
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                              letterSpacing: 0.28,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              widget.item is Aduan &&
                                      widget.item.buktiPhoto != null
                                  ? SizedBox(
                                      width: 114,
                                      height: 114,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: FutureBuilder<Uint8List?>(
                                          future: getFileController
                                              .getImage(widget.item.buktiPhoto),
                                          builder: (context,
                                              AsyncSnapshot<Uint8List?>
                                                  snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }
                                            if (snapshot.hasError) {
                                              return Center(
                                                  child: Text(
                                                      'Error: ${snapshot.error}'));
                                            }
                                            if (snapshot.hasData &&
                                                snapshot.data != null) {
                                              return Image.memory(
                                                snapshot.data!,
                                                fit: BoxFit.cover,
                                              );
                                            } else {
                                              return Image.asset(
                                                'assets/images/parkir_usm.png',
                                                fit: BoxFit.cover,
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 114,
                                      height: 114,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xffFEFCB9),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Iconsax.microphone,
                                            color: Color(0xffff8800),
                                            size: 45,
                                          ),
                                          Text(
                                            'aspirasi',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xffff8800),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                              letterSpacing: 0.32,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      widget.item is Aduan
                          ? Obx(() {
                              if (progressController.riwayatTerusan.isEmpty) {
                                return Container(); // No history forward data
                              }
                              var forward =
                                  progressController.riwayatTerusan[0];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Riwayat Penerusan',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                      letterSpacing: 0.48,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  CardStatus(
                                    judulSts: 'Pengaduan diteruskan',
                                    isiSts:
                                        'Pengaduan diteruskan dari ${forward.fromProgramStudi} ke ${forward.toProgramStudi}.',
                                    icon: Iconsax.direct_right,
                                    iconColor: iconColor,
                                    bgIcon: bgColor,
                                  ),
                                  // Add more cards if needed
                                ],
                              );
                            })
                          : const SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Riwayat Status',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: 0.48,
                            ),
                          ),
                          widget.item is Aduan
                              ? TextButton(
                                  onPressed: () {
                                    Get.to(() => KomentarPage(
                                        aduanId: widget.item?.id ?? 0));
                                  },
                                  child: Text(
                                    'Komentar',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF3E4095),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      letterSpacing: 0.28,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      const SizedBox(height: 6),
                      ...cardStatuses,
                      //
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
