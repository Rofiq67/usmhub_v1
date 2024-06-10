import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/aspirasi_page/domains/controllers/aspirasi_controller.dart';
import 'package:usmhub_v1/features/progress_page/presentations/widgets/card_progress.dart';

class HistoryAspirasi extends StatelessWidget {
  final AspirasiController aspirasiController = Get.find<AspirasiController>();

  HistoryAspirasi({super.key});

  Future<void> _refreshAduan() async {
    await aspirasiController.fetchRiwayatAspirasi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (aspirasiController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (aspirasiController.riwayatAspirasi.isEmpty) {
          return const Center(child: Text('Belum ada aspirasi.'));
        }

        var sedangBerjalan = aspirasiController.riwayatAspirasi
            .where((Aspirasi) => Aspirasi.status == 'Belum Dibaca')
            .toList();
        var selesai = aspirasiController.riwayatAspirasi
            .where((Aspirasi) => Aspirasi.status == 'Telah diterima')
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
                ...sedangBerjalan.map((Aspirasi) => CardProgress(
                      iconCard: Iconsax.lamp_on5,
                      colorIconCard: const Color(0xffff8800),
                      bgIconCard: const Color(0xffFEFCB9),
                      jdlCard: Aspirasi.jenisAspirasi,
                      stsCard: Aspirasi.status,
                      dateCard: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                          .format(Aspirasi.createdAt),
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
                ...selesai.map((Aspirasi) => CardProgress(
                      iconCard: Iconsax.lamp_on5,
                      colorIconCard: const Color(0xffff8800),
                      bgIconCard: const Color(0xffFEFCB9),
                      jdlCard: Aspirasi.jenisAspirasi,
                      stsCard: Aspirasi.status,
                      dateCard: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                          .format(Aspirasi.createdAt),
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
