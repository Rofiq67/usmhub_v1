import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:usmhub_v1/constants/constans.dart';
import 'package:usmhub_v1/features/progress_page/data/models/komentar_model.dart';
import 'package:usmhub_v1/features/registration_page/domains/controllers/auth.dart';

class KomentarController extends GetxController {
  final box = GetStorage();

  String get token => box.read('token') ?? '';

  Future<List<Komentar>> getKomentarList(int aduanId) async {
    try {
      var response = await http.get(
        Uri.parse('$url/komentar/$aduanId'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body)['komentar'];
        List<Komentar> komentars =
            responseData.map((model) => Komentar.fromJson(model)).toList();
        return komentars;
      } else {
        var responseData = json.decode(response.body);
        throw Exception('Failed to load comments: ${responseData['error']}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> kirimKomentar({
    required int aduanId,
    String? text,
    XFile? file, // Use XFile for file selection
  }) async {
    try {
      var uri = Uri.parse('$url/komentar/$aduanId/kirim');
      var request = http.MultipartRequest('POST', uri)
        ..headers.addAll({
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

      request.fields['aduan_id'] = aduanId.toString();

      if (text != null && text.isNotEmpty) {
        request.fields['text'] = text;
      }

      if (file != null) {
        var fileSize = await file.length();

        if (fileSize > 2048 * 1024) {
          throw Exception('File size exceeds limit (2MB)');
        }

        request.files.add(await http.MultipartFile.fromPath('file', file.path));
      }

      var response = await request.send();

      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Komentar berhasil dikirim',
            snackPosition: SnackPosition.TOP);
      } else {
        var responseData = await response.stream.bytesToString();
        var responseJson = json.decode(responseData);
        throw Exception(responseJson['error'] ?? 'Failed to send comment');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e',
          snackPosition: SnackPosition.TOP);
    }
  }

  Future<void> updateKomentar({
    required int komentarId,
    String? text,
    XFile? file,
  }) async {
    try {
      var uri = Uri.parse('$url/komentar/$komentarId/update');
      var request = http.MultipartRequest('POST', uri)
        ..headers.addAll({
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Get.find<AuthController>().token}',
        });

      if (text != null && text.isNotEmpty) {
        request.fields['text'] = text;
      }

      if (file != null) {
        var fileSize = await file.length();
        if (fileSize > 2048 * 1024) {
          throw Exception('Ukuran file melebihi batas (2MB)');
        }
        request.files.add(await http.MultipartFile.fromPath('file', file.path));
      }

      var response = await request.send();
      var responseData = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'Komentar berhasil diperbarui',
            snackPosition: SnackPosition.TOP);
      } else {
        var responseJson = json.decode(responseData);
        throw Exception(responseJson['error'] ?? 'Gagal memperbarui komentar');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e',
          snackPosition: SnackPosition.TOP);
    }
  }

  static Future<void> deleteKomentar(int komentarId) async {
    try {
      var response = await http.delete(
        Uri.parse('$url/komentar/$komentarId/delete'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Get.find<AuthController>().token}',
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Komentar berhasil dihapus',
            snackPosition: SnackPosition.TOP);
      } else {
        var responseData = json.decode(response.body);
        throw Exception(responseData['error'] ?? 'Failed to delete comment');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e',
          snackPosition: SnackPosition.TOP);
    }
  }
}
