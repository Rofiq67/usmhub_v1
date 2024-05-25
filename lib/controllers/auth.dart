import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usmhub_v1/constants/constans.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final isLoading = false.obs;

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
          'Content-Type': 'application/json', // tambahkan ini
        },
        body: jsonEncode(data), // ubah data menjadi JSON
      );

      if (response.statusCode == 201) {
        isLoading.value = false;
        debugPrint(response.body);
      } else {
        isLoading.value = false;
        debugPrint(response.body);
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
      Get.snackbar(
        'Error',
        'Terjadi kesalahan saat melakukan pendaftaran. Silakan coba lagi.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
