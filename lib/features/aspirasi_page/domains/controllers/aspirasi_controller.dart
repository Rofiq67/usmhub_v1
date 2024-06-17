// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:usmhub_v1/constants/constans.dart';
import 'package:usmhub_v1/features/aspirasi_page/data/models/aspirasi_models.dart';
import 'package:usmhub_v1/features/aspirasi_page/presentations/pages/sent_aspirasi.dart';

class AspirasiController extends GetxController {
  final isLoading = false.obs;
  final token = ''.obs;
  final box = GetStorage();

  var selectedJenisAspirasi = ''.obs;
  var selectedProgramStudi = ''.obs;
  var rating = 0.obs;
  var riwayatAspirasi = <Aspirasi>[].obs;

  Future<void> createAspirasi(Aspirasi aspirasi) async {
    try {
      isLoading.value = true;
      var request = http.MultipartRequest('POST', Uri.parse('$url/aspirasi'));
      request.headers['Authorization'] = 'Bearer ${box.read('token')}';
      request.fields.addAll(aspirasi
          .toJson()
          .map((key, value) => MapEntry(key, value.toString())));

      var response = await request.send();
      // ignore: unused_local_variable
      var responseData = await http.Response.fromStream(response);

      isLoading.value = false;
      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Aspirasi berhasil dibuat');
        await fetchRiwayatAspirasi();
        Get.to(() => const SentAspirasi());
      } else {
        Get.snackbar('Error', 'Terjadi kesalahan saat membuat aspirasi');
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
      Get.snackbar('Error', 'Terjadi kesalahan saat membuat aspirasi');
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
