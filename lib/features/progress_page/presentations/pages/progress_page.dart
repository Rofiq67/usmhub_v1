import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/aspirasi_page/data/models/aspirasi_models.dart';
import 'package:usmhub_v1/features/pengaduan_page/data/models/aduan_models.dart';
import 'package:usmhub_v1/features/progress_page/domains/controllers/progress_controller.dart';
import 'package:usmhub_v1/features/progress_page/presentations/pages/detail_progress.dart';
import 'package:usmhub_v1/features/progress_page/presentations/widgets/card_progress.dart';

class ProgressPage extends StatelessWidget {
  final ProgressController progressController = Get.put(ProgressController());

  ProgressPage({super.key});

  Future<void> _refreshHistory() async {
    await progressController.fetchRiwayat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: progressController.fetchRiwayat(), // Memuat data riwayat
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return Obx(() {
            if (progressController.riwayatAduan.isEmpty &&
                progressController.riwayatAspirasi.isEmpty) {
              return const Center(child: Text('Belum ada riwayat.'));
            }

            var sedangBerjalan = [
              ...progressController.riwayatAduan.where((aduan) =>
                  aduan.status == 'Belum Dibaca' ||
                  aduan.status == 'Ditindaklanjuti'),
              ...progressController.riwayatAspirasi
                  .where((aspirasi) => aspirasi.status == 'Belum Dibaca')
            ];

            var selesai = [
              ...progressController.riwayatAduan.where((aduan) =>
                  aduan.status == 'Selesai' || aduan.status == 'Ditolak'),
              ...progressController.riwayatAspirasi.where((aspirasi) =>
                  aspirasi.status == 'Telah diterima' ||
                  aspirasi.status == 'Ditolak')
            ];

            sedangBerjalan.sort((a, b) {
              var aDate = a is Aduan ? a.updatedAt : (a as Aspirasi).updatedAt;
              var bDate = b is Aduan ? b.updatedAt : (b as Aspirasi).updatedAt;
              return bDate.compareTo(aDate);
            });
            selesai.sort((a, b) {
              var aDate = a is Aduan ? a.updatedAt : (a as Aspirasi).updatedAt;
              var bDate = b is Aduan ? b.updatedAt : (b as Aspirasi).updatedAt;
              return bDate.compareTo(aDate);
            });

            return RefreshIndicator(
              onRefresh: _refreshHistory,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    const SizedBox(height: 64),
                    Text(
                      'Progress',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF1C1C1C),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 0.48,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Sedang Berjalan',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF1C1C1C),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 0.48,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...sedangBerjalan.map((item) {
                      var jenis = item is Aduan
                          ? item.jenisPengaduan
                          : (item as Aspirasi).jenisAspirasi;
                      var status = item is Aduan
                          ? item.status
                          : (item as Aspirasi).status;
                      var createdAt = item is Aduan
                          ? item.createdAt
                          : (item as Aspirasi).createdAt;
                      return CardProgress(
                        iconCard: item is Aduan
                            ? Iconsax.microphone
                            : Iconsax.lamp_on5,
                        colorIconCard: item is Aduan
                            ? const Color(0xff3E4095)
                            : const Color(0xffff8800),
                        bgIconCard: item is Aduan
                            ? const Color(0xFFBCBEF3)
                            : const Color(0xffFEFCB9),
                        jdlCard: jenis,
                        stsCard: status,
                        dateCard: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                            .format(createdAt),
                        onPressed: () {
                          Get.to(() => DetailProgress(item: item));
                        },
                      );
                    }),
                    const SizedBox(height: 32),
                    Text(
                      'Selesai',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF1C1C1C),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 0.48,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...selesai.map((item) {
                      var jenis = item is Aduan
                          ? item.jenisPengaduan
                          : (item as Aspirasi).jenisAspirasi;
                      var status = item is Aduan
                          ? item.status
                          : (item as Aspirasi).status;
                      var createdAt = item is Aduan
                          ? item.createdAt
                          : (item as Aspirasi).createdAt;
                      return CardProgress(
                        iconCard: item is Aduan
                            ? Iconsax.microphone
                            : Iconsax.lamp_on5,
                        colorIconCard: item is Aduan
                            ? const Color(0xff3E4095)
                            : const Color(0xffff8800),
                        bgIconCard: item is Aduan
                            ? const Color(0xFFBCBEF3)
                            : const Color(0xffFEFCB9),
                        jdlCard: jenis,
                        stsCard: status,
                        dateCard: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                            .format(createdAt),
                        onPressed: () {
                          Get.to(() => DetailProgress(item: item));
                        },
                      );
                    }),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
