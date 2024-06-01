import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:usmhub_v1/constants/constans.dart';
import 'package:usmhub_v1/features/aspirasi_page/data/models/aspirasi_models.dart';

class AspirasiController extends GetxController {
  var isLoading = false.obs;
  var riwayatAspirasi = <Aspirasi>[].obs;

  Future<void> fetchRiwayatAspirasi(String token) async {
    try {
      isLoading.value = true;
      final response = await http.get(
        Uri.parse('$url/riwayatAspirasi'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        riwayatAspirasi.value =
            body.map((json) => Aspirasi.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load riwayat aspirasi');
      }
    } catch (e) {
      print('Error fetching riwayat aspirasi: $e');
      Get.snackbar(
        'Error',
        'Gagal memuat riwayat aspirasi',
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createAspirasi(Aspirasi aspirasi, String token) async {
    try {
      isLoading.value = true;
      var request = http.MultipartRequest('POST', Uri.parse('$url/aspirasi'));
      request.headers['Authorization'] = 'Bearer $token';
      request.fields['jenis_aspirasi'] = aspirasi.jenisAspirasi;
      request.fields['program_studi'] = aspirasi.programStudi;
      request.fields['keterangan'] = aspirasi.keterangan;
      request.fields['rating'] = aspirasi.rating.toString();

      var response = await request.send();
      if (response.statusCode == 201) {
        await fetchRiwayatAspirasi(token);
      } else {
        throw Exception('Failed to create pengaduan');
      }
    } catch (e) {
      print('Error creating pengaduan: $e');
      Get.snackbar(
        'Error',
        'Gagal membuat pengaduan',
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
