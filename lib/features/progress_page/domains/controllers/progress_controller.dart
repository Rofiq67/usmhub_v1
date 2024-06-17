// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:usmhub_v1/constants/constans.dart';
import 'package:usmhub_v1/features/pengaduan_page/data/models/aduan_models.dart';
import 'package:usmhub_v1/features/aspirasi_page/data/models/aspirasi_models.dart';

class ProgressController extends GetxController {
  final isLoading = false.obs;
  final token = ''.obs;
  final box = GetStorage();

  var riwayatAduan = <Aduan>[].obs;
  var riwayatAspirasi = <Aspirasi>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRiwayat();
  }

  Future<void> fetchRiwayat() async {
    await fetchRiwayatAduan();
    await fetchRiwayatAspirasi();
  }

  Future<void> fetchRiwayatAduan() async {
    try {
      isLoading.value = true;
      var token = box.read('token');
      if (token != null) {
        var response = await http.get(
          Uri.parse('$url/listaduan'),
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body) as List;
          riwayatAduan.value = data.map((e) => Aduan.fromJson(e)).toList();
        } else {
          Get.snackbar('Error', 'Gagal mengambil data riwayat pengaduan');
        }
      } else {
        Get.snackbar('Error', 'Token tidak tersedia');
      }
    } catch (e) {
      print(e);
      Get.snackbar(
          'Error', 'Terjadi kesalahan saat mengambil data riwayat pengaduan');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchRiwayatAspirasi() async {
    try {
      isLoading.value = true;
      var token = box.read('token');
      if (token != null) {
        var response = await http.get(
          Uri.parse('$url/listaspirasi'),
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body) as List;
          riwayatAspirasi.value =
              data.map((e) => Aspirasi.fromJson(e)).toList();
        } else {
          Get.snackbar('Error', 'Gagal mengambil data riwayat aspirasi');
        }
      } else {
        Get.snackbar('Error', 'Token tidak tersedia');
      }
    } catch (e) {
      print(e);
      Get.snackbar(
          'Error', 'Terjadi kesalahan saat mengambil data riwayat aspirasi');
    } finally {
      isLoading.value = false;
    }
  }
}
