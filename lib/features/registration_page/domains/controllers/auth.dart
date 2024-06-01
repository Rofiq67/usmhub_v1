// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, unnecessary_null_aware_assignments

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/constants/constans.dart';
import 'package:http/http.dart' as http;
// import 'package:usmhub_v1/features/home_page/presentations/pages/homepage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:usmhub_v1/features/aspirasi_page/presentations/pages/aspirasi.dart';
import 'package:usmhub_v1/features/pengaduan_page/presentations/pages/pengaduan.dart';
import 'package:usmhub_v1/features/pengaduan_page/presentations/pages/post_pengaduan.dart';
import 'package:usmhub_v1/main.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final token = ''.obs;

  final box = GetStorage();

  Future register({
    required String first_name,
    required String last_name,
    required String username,
    required String email,
    required String password,
    String? img_profil,
    required DateTime tgl_lahir,
    required String progdi,
    required String gender,
  }) async {
    try {
      isLoading.value = true;

      String formattedDate = tgl_lahir.toIso8601String();
      img_profil ??= null;

      var data = {
        'first_name': first_name,
        'last_name': last_name,
        'username': username,
        'email': email,
        'password': password,
        'img_profil': img_profil,
        'tgl_lahir': formattedDate,
        'progdi': progdi,
        'gender': gender,
      };

      var response = await http.post(
        Uri.parse('$url/register'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      isLoading.value = false;

      if (response.statusCode == 201) {
        token.value = json.decode(response.body)['token'];
        box.write('token', token.value);
        Get.offAll(() => const MainPage());
        debugPrint(response.body);
        Get.snackbar(
          'Success',
          'Pendaftaran berhasil',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        var responseData = json.decode(response.body);
        Get.snackbar(
            'Error',
            responseData['message'] ??
                'Terjadi kesalahan saat melakukan pendaftaran. Silakan coba lagi.',
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            messageText: Text(
              'Pastikan data telah terisi semua',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.32,
              ),
            ),
            titleText: Text(
              'Error',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: 0.32,
              ),
            ),
            icon: const Icon(
              Iconsax.warning_2,
              size: 25,
            ));
        debugPrint(response.body);
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
      Get.snackbar('Error',
          'Terjadi kesalahan saat melakukan pendaftaran. Silakan coba lagi.',
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          messageText: Text(
            'Pastikan data telah terisi semua',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.32,
            ),
          ),
          titleText: Text(
            'Error',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 0,
              letterSpacing: 0.32,
            ),
          ),
          icon: const Icon(
            Iconsax.warning_2,
            size: 25,
          ));
    }
  }

  Future loginApi({
    required String username,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'username': username,
        'password': password,
      };

      var response = await http.post(
        Uri.parse('$url/loginApi'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );

      if (response.statusCode == 200) {
        isLoading.value = false;
        // print(json.decode(response.body),
        token.value = json.decode(response.body)['token'];
        box.write('token', token.value);
        Get.offAll(() => const MainPage());
      } else {
        isLoading.value = false;
        Get.snackbar(
          'error',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
        );
        print(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}
