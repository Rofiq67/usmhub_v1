import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:usmhub_v1/constants/constans.dart';
import 'package:usmhub_v1/features/settings_page/data/models/user_model.dart';

class SettingsController {
  final box = GetStorage();

  String get token => box.read('token') ?? '';

  Future<User> getUserProfile(String token) async {
    final response = await http.get(
      Uri.parse('$url/user/profile'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user profile');
    }
  }

  Future<User> updateProfile(User user, File? profileImage) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$url/user/profile/update'),
      );
      request.headers['Authorization'] = 'Bearer $token';

      // Add text fields
      request.fields['first_name'] = user.firstName;
      request.fields['last_name'] = user.lastName;
      request.fields['username'] = user.username;
      request.fields['email'] = user.email;

      // Format tgl_lahir to 'yyyy-MM-dd' format
      if (user.tglLahir != null) {
        request.fields['tgl_lahir'] =
            DateFormat('yyyy-MM-dd').format(user.tglLahir!);
      } else {
        request.fields['tgl_lahir'] = '';
      }

      request.fields['progdi'] = user.progdi;
      request.fields['gender'] = user.gender;

      // Add profile image if selected
      if (profileImage != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'img_profile',
          profileImage.path,
        ));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        return User.fromJson(jsonDecode(responseData)['user']);
      } else {
        throw Exception('Failed to update user profile');
      }
    } catch (e) {
      throw Exception('Failed to update user profile: $e');
    }
  }

  Future<void> updatePassword(String password, String confirmPassword) async {
    try {
      final response = await http.post(
        Uri.parse('$url/user/password/update'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'password': password,
          'password_confirmation': confirmPassword, // Laravel expects this key
        }),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        Get.snackbar(
          'Success',
          responseData['message'], // Print success message from backend
        );
      } else if (response.statusCode == 400) {
        var errors = jsonDecode(response.body)['errors'];

        // Handle validation errors from the backend
        String errorMessage = '';
        errors.forEach((key, value) {
          errorMessage += '$key: $value\n';
        });
        Get.snackbar(
          'Error',
          errorMessage,
        );
      } else {
        throw Exception('Failed to update password: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update password: $e',
      );
    }
  }
}
