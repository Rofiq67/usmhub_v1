// ignore_for_file: avoid_print

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:usmhub_v1/constants/constans.dart';

class GetfileController extends GetxController {
  final box = GetStorage();
  final isLoading = false.obs;

  Future<Uint8List?> getImage(String filename) async {
    try {
      final token = box.read('token');
      filename = filename.startsWith('/') ? filename.substring(1) : filename;
      final completeUrl = '$url/$filename';
      print('Fetching image from URL: $completeUrl');
      print('Using token: $token');

      if (token != null) {
        isLoading.value = true;
        final response = await http.get(
          Uri.parse(completeUrl),
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        );
        isLoading.value = false;

        if (response.statusCode == 200) {
          print('Response received: ${response.bodyBytes.length} bytes');

          // Check MIME type to ensure it's an image
          final contentType = response.headers['content-type'];
          if (contentType != null && contentType.startsWith('image/')) {
            try {
              // ignore: unused_local_variable
              final image = await decodeImageFromList(response.bodyBytes);
              return response.bodyBytes;
            } catch (e) {
              print('Error decoding image data: $e');
              return null;
            }
          } else {
            print('Invalid MIME type: $contentType');
            return null;
          }
        } else {
          print('Error fetching image: ${response.statusCode}');
          print('Response body: ${response.body}');
          return null;
        }
      } else {
        print('Token is null');
        return null;
      }
    } catch (e) {
      isLoading.value = false;
      print('Error getting image: $e');
      rethrow;
    }
  }

  Future<Uint8List?> getDoc(String filedoc) async {
    try {
      final token = box.read('token');
      filedoc = filedoc.startsWith('/') ? filedoc.substring(1) : filedoc;
      final completeUrl =
          '$url/$filedoc'; // Sesuaikan dengan endpoint yang tepat
      print('Fetching document from URL: $completeUrl');
      print('Using token: $token');

      if (token != null) {
        final response = await http.get(
          Uri.parse(completeUrl),
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          print('Response received: ${response.bodyBytes.length} bytes');
          return response.bodyBytes;
        } else {
          print('Error fetching document: ${response.statusCode}');
          return null;
        }
      } else {
        print('Token is null');
        return null;
      }
    } catch (e) {
      print('Error getting document: $e');
      rethrow;
    }
  }

  Future<Uint8List?> getFileKomentar(String filekomentar) async {
    try {
      final token = box.read('token');
      filekomentar = filekomentar.startsWith('/')
          ? filekomentar.substring(1)
          : filekomentar;
      final completeUrl = '$url/$filekomentar';
      print('Fetching file komentar from URL: $completeUrl');
      print('Using token: $token');

      if (token != null) {
        final response = await http.get(
          Uri.parse(completeUrl),
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          return response.bodyBytes;
        } else {
          print('Error fetching file komentar: ${response.statusCode}');
          return null;
        }
      } else {
        print('Token is null');
        return null;
      }
    } catch (e) {
      print('Error getting file komentar: $e');
      rethrow;
    }
  }
}
