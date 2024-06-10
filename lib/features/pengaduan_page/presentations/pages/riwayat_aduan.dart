import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/pengaduan_page/domains/controllers/pengaduan_controller.dart';
import 'package:usmhub_v1/features/progress_page/presentations/widgets/card_progress.dart';

class RiwayatAduan extends StatelessWidget {
  final PengaduanController pengaduanController =
      Get.find<PengaduanController>();

  RiwayatAduan({super.key});

  Future<void> _refreshAduan() async {
    await pengaduanController.fetchRiwayatAduan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (pengaduanController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (pengaduanController.riwayatAduan.isEmpty) {
          return const Center(child: Text('Belum ada pengaduan.'));
        }

        var sedangBerjalan = pengaduanController.riwayatAduan
            .where((aduan) =>
                aduan.status == 'Belum Dibaca' ||
                aduan.status == 'Ditindaklanjuti')
            .toList();
        var selesai = pengaduanController.riwayatAduan
            .where((aduan) => aduan.status == 'Selesai')
            .toList();

        return RefreshIndicator(
          onRefresh: _refreshAduan,
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
                  'Sedang berjalan',
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
                ...sedangBerjalan.map((aduan) => CardProgress(
                      iconCard: Iconsax.microphone,
                      colorIconCard: const Color(0xff3E4095),
                      bgIconCard: const Color(0xFFBCBEF3),
                      jdlCard: aduan.jenisPengaduan,
                      stsCard: aduan.status,
                      dateCard: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                          .format(aduan.createdAt),
                      onPressed: () {},
                    )),
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
                ...selesai.map((aduan) => CardProgress(
                      iconCard: Iconsax.microphone,
                      colorIconCard: const Color(0xff3E4095),
                      bgIconCard: const Color(0xFFBCBEF3),
                      jdlCard: aduan.jenisPengaduan,
                      stsCard: aduan.status,
                      dateCard: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                          .format(aduan.createdAt),
                      onPressed: () {},
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
