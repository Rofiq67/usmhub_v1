import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/aspirasi_page/data/models/aspirasi_models.dart';
import 'package:usmhub_v1/features/pengaduan_page/data/models/aduan_models.dart';
import 'package:usmhub_v1/features/progress_page/domains/controllers/progress_controller.dart';
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
      body: Obx(() {
        if (progressController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (progressController.riwayatAduan.isEmpty &&
            progressController.riwayatAspirasi.isEmpty) {
          return const Center(child: Text('Belum ada riwayat.'));
        }

        var sedangBerjalan = [
          ...progressController.riwayatAduan.where((aduan) =>
              (aduan).status == 'Belum Dibaca' ||
              aduan.status == 'Ditindaklanjuti'),
          ...progressController.riwayatAspirasi
              .where((aspirasi) => (aspirasi).status == 'Belum Dibaca')
        ];

        var selesai = [
          ...progressController.riwayatAduan
              .where((aduan) => (aduan).status == 'Selesai'),
          ...progressController.riwayatAspirasi
              .where((aspirasi) => (aspirasi).status == 'Telah diterima')
        ];

        return RefreshIndicator(
          onRefresh: _refreshHistory,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                const SizedBox(height: 64),
                const Text(
                  'Progress',
                  style: TextStyle(
                    color: Color(0xFF1C1C1C),
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: 0.48,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Sedang Berjalan',
                  style: TextStyle(
                    color: Color(0xFF1C1C1C),
                    fontSize: 24,
                    fontFamily: 'Poppins',
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
                  var status =
                      item is Aduan ? item.status : (item as Aspirasi).status;
                  var createdAt = item is Aduan
                      ? item.createdAt
                      : (item as Aspirasi).createdAt;
                  return CardProgress(
                    iconCard:
                        item is Aduan ? Iconsax.microphone : Iconsax.lamp_on5,
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
                  );
                }),
                const SizedBox(height: 32),
                const Text(
                  'Selesai',
                  style: TextStyle(
                    color: Color(0xFF1C1C1C),
                    fontSize: 24,
                    fontFamily: 'Poppins',
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
                  var status =
                      item is Aduan ? item.status : (item as Aspirasi).status;
                  var createdAt = item is Aduan
                      ? item.createdAt
                      : (item as Aspirasi).createdAt;
                  return CardProgress(
                    iconCard:
                        item is Aduan ? Iconsax.microphone : Iconsax.lamp_on5,
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
                  );
                }),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      }),
    );
  }
}
