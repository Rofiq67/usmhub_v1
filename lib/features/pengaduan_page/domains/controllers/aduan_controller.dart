import 'dart:convert';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:usmhub_v1/constants/constans.dart';
import 'package:usmhub_v1/features/pengaduan_page/data/models/aduan_models.dart';

class AduanController extends GetxController {
  var isLoading = false.obs;
  var riwayatPengaduan = <Aduan>[].obs;

  Future<void> fetchRiwayatPengaduan(String token) async {
    try {
      isLoading.value = true;
      final response = await http.get(
        Uri.parse('$url/listaduan'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        riwayatPengaduan.value =
            body.map((json) => Aduan.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load riwayat pengaduan');
      }
    } catch (e) {
      print('Error fetching riwayat pengaduan: $e');
      Get.snackbar(
        'Error',
        'Gagal memuat riwayat pengaduan',
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createPengaduan(Aduan aduan, String token) async {
    try {
      isLoading.value = true;
      var request = http.MultipartRequest('POST', Uri.parse('$url/pengaduan'));
      request.headers['Authorization'] = 'Bearer $token';
      request.fields['jenis_pengaduan'] = aduan.jenisPengaduan;
      request.fields['program_studi'] = aduan.programStudi;
      request.fields['keterangan'] = aduan.keterangan;
      request.fields['rating'] = aduan.rating.toString();
      var pic = await http.MultipartFile.fromPath(
          'bukti_photo', aduan.buktiPhoto ?? '');
      request.files.add(pic);

      var response = await request.send();
      if (response.statusCode == 201) {
        await fetchRiwayatPengaduan(token);
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
