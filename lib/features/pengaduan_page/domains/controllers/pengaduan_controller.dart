// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:usmhub_v1/constants/constans.dart';
import 'package:usmhub_v1/features/pengaduan_page/data/models/aduan_models.dart';
import 'package:usmhub_v1/features/pengaduan_page/presentations/pages/riwayat_aduan.dart';
import 'package:usmhub_v1/features/pengaduan_page/presentations/pages/sent_pengaduan.dart';

class PengaduanController extends GetxController {
  final isLoading = false.obs;
  final token = ''.obs;
  final box = GetStorage();

  var selectedJenisPengaduan = ''.obs;
  var selectedProgramStudi = ''.obs;
  var rating = 0.obs;
  // File? buktiPhoto;
  var buktiPhoto = Rx<File?>(null);
  var riwayatAduan = <Aduan>[].obs;

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      buktiPhoto.value = File(pickedFile.path);
    }
  }

  Future<void> createPengaduan(Aduan aduan) async {
    try {
      isLoading.value = true;
      var request = http.MultipartRequest('POST', Uri.parse('$url/pengaduan'));
      request.headers['Authorization'] = 'Bearer ${box.read('token')}';
      request.fields.addAll(
          aduan.toJson().map((key, value) => MapEntry(key, value.toString())));

      // Periksa jika buktiPhoto tidak null
      if (buktiPhoto.value != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'bukti_photo', buktiPhoto.value!.path));
      } else {
        // Jika tidak ada foto yang diunggah, kirim nilai null atau string kosong ke backend
        request.fields['bukti_photo'] = ''; // atau null
      }

      var response = await request.send();
      // ignore: unused_local_variable
      var responseData = await http.Response.fromStream(response);

      isLoading.value = false;
      if (response.statusCode == 201) {
        Get.snackbar(
          'Success',
          'Pengaduan berhasil dibuat',
        );
        await fetchRiwayatAduan();
        Get.to(() => const SentPengaduan());
      } else {
        Get.snackbar('Error', 'Terjadi kesalahan saat membuat pengaduan');
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
      Get.snackbar('Error', 'Terjadi kesalahan saat membuat pengaduan');
    }
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
}
