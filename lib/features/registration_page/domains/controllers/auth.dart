// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, unnecessary_null_aware_assignments, avoid_print, invalid_use_of_protected_member

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:usmhub_v1/constants/constans.dart';
import 'package:http/http.dart' as http;
// import 'package:usmhub_v1/features/home_page/presentations/pages/homepage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:usmhub_v1/features/registration_page/presentations/pages/login_page.dart';
import 'package:usmhub_v1/main.dart';

class AuthController extends GetxController {
  final box = GetStorage();
  var isLoading = false.obs;
  var token = ''.obs;
  var userProfile = {}.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  void loadUserProfile() {
    userProfile.value = box.read('userProfile') ?? {};
  }

  Future<void> register({
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

      var data = {
        'first_name': first_name,
        'last_name': last_name,
        'username': username,
        'email': email,
        'password': password,
        'tgl_lahir': formattedDate,
        'progdi': progdi,
        'gender': gender,
      };
      if (img_profil != null) {
        data['img_profil'] = img_profil;
      }

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
        var responseData = json.decode(response.body);
        token.value = responseData['token'] ?? '';
        box.write('token', token.value);
        userProfile.value = responseData['user'] ?? {};
        box.write('userProfile', userProfile.value);

        Get.offAll(() => const MainPage());

        Get.snackbar(
          'Success',
          'Registration successful',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        var responseData = json.decode(response.body);
        Get.snackbar(
          'Error',
          responseData['message'] ??
              'An error occurred while registering. Please try again.',
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          messageText: Text(
            'Pastikan semuanya telah terisi',
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
          ),
        );
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
      Get.snackbar(
        'Error',
        'An error occurred while registering. Please try again.',
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        messageText: Text(
          'Make sure all data fields are filled',
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
        ),
      );
    }
  }

  Future<void> loginApi({
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
        var responseData = json.decode(response.body);
        token.value = responseData['token'];
        userProfile.value = responseData['user'];
        box.write('token', token.value);
        box.write('userProfile', userProfile.value);
        Get.offAll(() => const MainPage());
      } else {
        isLoading.value = false;
        Get.snackbar(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          'Gagal',
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

  Future<void> logout() async {
    try {
      isLoading.value = true;

      var response = await http.post(
        Uri.parse('$url/logout'),
        headers: {
          'Authorization': 'Bearer ${token.value}',
          'Accept': 'application/json',
        },
      );

      isLoading.value = false;

      if (response.statusCode == 200) {
        token.value = '';
        box.remove('token');
        box.remove('userProfile');
        Get.offAll(() => const LoginPage());
        Get.snackbar(
          'Success',
          'Logout berhasil',
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        );
      } else {
        Get.snackbar(
          'Error',
          'Gagal melakukan logout. Silakan coba lagi.',
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          messageText: Text(
            'Pastikan koneksi internet Anda stabil.',
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
          ),
        );
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
      Get.snackbar(
        'Error',
        'Gagal melakukan logout. Silakan coba lagi.',
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        messageText: Text(
          'Pastikan koneksi internet Anda stabil.',
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
        ),
      );
    }
  }

  Future<void> updateProfile({
    required String first_name,
    required String last_name,
    required String username,
    required String email,
    File? img_profile,
    required DateTime tgl_lahir,
    required String progdi,
    required String gender,
  }) async {
    try {
      isLoading.value = true;

      String formattedDate = DateFormat('yyyy-MM-dd').format(tgl_lahir);

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$url/user/profile/update'),
      );

      // Tambahkan header Authorization
      request.headers['Authorization'] = 'Bearer ${token.value}';

      // Tambahkan fields untuk data profil
      request.fields['first_name'] = first_name;
      request.fields['last_name'] = last_name;
      request.fields['username'] = username;
      request.fields['email'] = email;
      request.fields['tgl_lahir'] = formattedDate;
      request.fields['progdi'] = progdi;
      request.fields['gender'] = gender;

      // Tambahkan file gambar profil jika ada
      if (img_profile != null) {
        var imgProfileStream = http.ByteStream(img_profile.openRead());
        var length = await img_profile.length();
        var imgProfileMultipartFile = http.MultipartFile(
          'img_profile',
          imgProfileStream,
          length,
          filename: img_profile.path.split('/').last,
        );
        request.files.add(imgProfileMultipartFile);
      }

      var response = await http.Response.fromStream(await request.send());

      isLoading.value = false;

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        userProfile.value = responseData['user'] ?? {};
        box.write('userProfile', userProfile.value);
      } else {
        var responseData = json.decode(response.body);
        throw Exception(responseData['message'] ??
            'An error occurred while updating profile. Please try again.');
      }
    } catch (e) {
      isLoading.value = false;
      throw Exception(
          'An error occurred while updating profile. Please try again.');
    }
  }

  Future<void> updatePassword({
    required String password,
    required String password_confirmation,
  }) async {
    try {
      isLoading.value = true;

      var data = {
        'password': password,
        'password_confirmation': password_confirmation,
      };

      var response = await http.post(
        Uri.parse('$url/user/password/update'),
        headers: {
          'Authorization': 'Bearer ${token.value}',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      isLoading.value = false;

      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Password updated successfully',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        var responseData = json.decode(response.body);
        Get.snackbar(
          'Error',
          responseData['message'] ??
              'An error occurred while updating password. Please try again.',
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        );
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
      Get.snackbar(
        'Error',
        'Masukan Password dengan 8 Karakter',
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      );
    }
  }

  Future<void> forgotPassword({
    required String username,
    required String password_baru,
    required String password_baru_confirmation,
  }) async {
    try {
      isLoading.value = true;

      var data = {
        'username': username,
        'password_baru': password_baru,
        'password_baru_confirmation': password_baru_confirmation,
      };

      var response = await http.post(
        Uri.parse('$url/forgot-password'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      isLoading.value = false;

      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Password has been reset successfully',
          snackPosition: SnackPosition.TOP,
        );
        Get.offAll(() => const LoginPage());
      } else if (response.statusCode == 404) {
        Get.snackbar(
          'Error',
          'Username tidak ditemukan',
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        );
      } else {
        var responseData = json.decode(response.body);
        Get.snackbar(
          'Gagal',
          responseData['message'] ?? 'Username Tidak Ditemukan',
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        );
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
      Get.snackbar(
        'Gagal',
        'Terjadi Kesalahan Username dan Password.',
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      );
    }
  }
}
