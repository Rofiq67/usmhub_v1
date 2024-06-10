import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:usmhub_v1/features/aspirasi_page/data/models/aspirasi_models.dart';
import 'package:usmhub_v1/features/pengaduan_page/data/models/aduan_models.dart';
import 'package:usmhub_v1/features/progress_page/presentations/pages/room_chat.dart';
import 'package:usmhub_v1/features/progress_page/presentations/widgets/card_status.dart';
import 'package:usmhub_v1/features/progress_page/presentations/widgets/modal_progress.dart';

class DetailProgress extends StatefulWidget {
  final dynamic item;

  const DetailProgress({super.key, required this.item});

  @override
  State<DetailProgress> createState() => _DetailProgressState();
}

class _DetailProgressState extends State<DetailProgress> {
  @override
  Widget build(BuildContext context) {
    String jenis = widget.item is Aduan
        ? widget.item.jenisPengaduan
        : (widget.item as Aspirasi).jenisAspirasi;
    String status = widget.item is Aduan
        ? widget.item.status
        : (widget.item as Aspirasi).status;
    DateTime createdAt = widget.item is Aduan
        ? widget.item.createdAt
        : (widget.item as Aspirasi).createdAt;

    List<Widget> cardStatuses = [];

    Color iconColor = widget.item is Aduan
        ? const Color(0xff3E4095)
        : const Color(0xffff8800);
    Color bgColor = widget.item is Aduan
        ? const Color(0xFFBCBEF3)
        : const Color(0xffFEFCB9);

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
      cardStatuses.add(
        CardStatus(
          judulSts: 'Aspirasi Telah Diterima',
          isiSts: 'Laporan aspirasi telah diterima.',
          icon: Iconsax.tick_circle,
          iconColor: iconColor,
          bgIcon: bgColor,
        ),
      );
    }

    if (status == 'Telah diterima') {
      cardStatuses.addAll([
        CardStatus(
          judulSts: 'Aspirasi telah diverifikasi',
          isiSts: 'Laporan aspirasi berhasil terverifikasi.',
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
              'Laporan pengaduan sedang ditindaklanjuti. Jika ada pertanyaan, silahkan kirim pesan.',
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
        status == 'Telah diterima') {
      cardStatuses.add(
        CardStatus(
          judulSts: widget.item is Aduan
              ? 'Menunggu Verifikasi Pengaduan'
              : 'Menunggu Verifikasi Aspirasi',
          isiSts: widget.item is Aduan
              ? 'Laporan pengaduan memasuki tahap pengecekan, dan akan diteruskan untuk ditindaklanjuti'
              : 'Laporan aspirasi memasuki tahap pengecekan, dan akan diteruskan untuk ditindaklanjuti',
          icon: Iconsax.clock,
          iconColor: iconColor,
          bgIcon: bgColor,
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:
            Text(widget.item is Aduan ? 'Detail Pengaduan' : 'Detail Aspirasi'),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                        color: Color(0xFF757F90),
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
                                      'Tujuan Wewenang',
                                      style: GoogleFonts.poppins(
                                        color: Color(0xFF757F90),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Keterangan',
                                      style: GoogleFonts.poppins(
                                        color: Color(0xFF757F90),
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
                                            color: Color(0xFF1C1C1C),
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
                                        color: Color(0xFF757F90),
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Bukti Photo',
                                                style: GoogleFonts.poppins(
                                                  color: Color(0xFF757F90),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.32,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Container(
                                                  width: double.infinity,
                                                  height: 114,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    child: Image.asset(
                                                      'assets/images/parkir_usm.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )

                                                  // ClipRRect(
                                                  //     borderRadius:
                                                  //         BorderRadius.circular(16),
                                                  //     child: Image.network(
                                                  //       widget.item.buktiPhoto,
                                                  //       fit: BoxFit.fill,
                                                  //     ),
                                                  //   )
                                                  // : (widget.item is Aspirasi &&
                                                  //         widget.item.buktiPhoto ==
                                                  //             null)
                                                  //     ? Placeholder() // Placeholder jika tidak ada gambar pada aspirasi
                                                  //     : const SizedBox
                                                  //         .shrink(), // Menghilangkan konten jika tidak ada gambar pada aduan
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
                    width: 353,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                  width: 45,
                                ),
                                Text(
                                  'Klik detail',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFF757F90),
                                    fontSize: 12,
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
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                  letterSpacing: 0.32,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  DateFormat('dd MMM yyyy').format(createdAt),
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFF757F90),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 0.28,
                                  ),
                                ),
                                const SizedBox(width: 55),
                                Row(
                                  children: [
                                    Container(
                                      width: 9,
                                      height: 9,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFF20EA00),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'aktif',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFF1C1C1C),
                                        fontSize: 14,
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
                        SizedBox(
                          width: 114,
                          height: 114,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/parkir_usm.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
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
                const SizedBox(height: 16),
                ...cardStatuses,
                //
              ],
            ),
            Positioned(
                right: 20,
                bottom: 32,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const RoomChat());
                    },
                    child: Text('Kirim Pesan')))
          ],
        ),
      ),
    );
  }
}
