import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iconsax/iconsax.dart';
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

        var sedangBerjalanAduan = progressController.riwayatAduan
            .where((aduan) =>
                aduan.status == 'Belum Dibaca' ||
                aduan.status == 'Ditindaklanjuti')
            .toList();
        var selesaiAduan = progressController.riwayatAduan
            .where((aduan) => aduan.status == 'Selesai')
            .toList();
        var sedangBerjalanAspirasi = progressController.riwayatAspirasi
            .where((aspirasi) => aspirasi.status == 'Belum Dibaca')
            .toList();
        var selesaiAspirasi = progressController.riwayatAspirasi
            .where((aspirasi) => aspirasi.status == 'Telah diterima')
            .toList();

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
                  'Sedang berjalan - Aduan',
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
                ...sedangBerjalanAduan.map((aduan) => CardProgress(
                      iconCard: Iconsax.microphone,
                      colorIconCard: const Color(0xff3E4095),
                      bgIconCard: const Color(0xFFBCBEF3),
                      jdlCard: aduan.jenisPengaduan,
                      stsCard: aduan.status,
                      dateCard: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                          .format(aduan.createdAt),
                    )),
                const SizedBox(height: 32),
                const Text(
                  'Sedang berjalan - Aspirasi',
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
                ...sedangBerjalanAspirasi.map((aspirasi) => CardProgress(
                      iconCard: Iconsax.microphone,
                      colorIconCard: const Color(0xff3E4095),
                      bgIconCard: const Color(0xFFBCBEF3),
                      jdlCard: aspirasi.jenisAspirasi,
                      stsCard: aspirasi.status,
                      dateCard: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                          .format(aspirasi.createdAt),
                    )),
                const SizedBox(height: 32),
                const Text(
                  'Selesai - Aduan',
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
                ...selesaiAduan.map((aduan) => CardProgress(
                      iconCard: Iconsax.microphone,
                      colorIconCard: const Color(0xff3E4095),
                      bgIconCard: const Color(0xFFBCBEF3),
                      jdlCard: aduan.jenisPengaduan,
                      stsCard: aduan.status,
                      dateCard: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                          .format(aduan.createdAt),
                    )),
                const SizedBox(height: 32),
                const Text(
                  'Selesai - Aspirasi',
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
                ...selesaiAspirasi.map((aspirasi) => CardProgress(
                      iconCard: Iconsax.microphone,
                      colorIconCard: const Color(0xff3E4095),
                      bgIconCard: const Color(0xFFBCBEF3),
                      jdlCard: aspirasi.jenisAspirasi,
                      stsCard: aspirasi.status,
                      dateCard: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                          .format(aspirasi.createdAt),
                    )),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      }),
    );
  }
}
