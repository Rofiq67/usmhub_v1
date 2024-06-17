import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:usmhub_v1/constants/constans.dart';
import 'package:usmhub_v1/features/home_page/data/models/feed_models.dart';

class HomeController extends GetxController {
  final feeds = <Feed>[].obs;
  final isLoading = false.obs;
  final token = GetStorage().read('token');

  @override
  void onInit() {
    super.onInit();
    fetchFeeds(); // Ensure this is called during initialization
  }

  Future<void> fetchFeeds() async {
    try {
      isLoading.value = true;
      var response = await http.get(
        Uri.parse('$url/feeds'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var data = json.decode(response.body)['feeds'] as List;
        // print('Parsed data: $data');
        feeds.value = data.map((feed) => Feed.fromJson(feed)).toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch feeds');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<Feed?> getFeedById(int id) async {
    try {
      var response = await http.get(
        Uri.parse('$url/feed/view/$id'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var data = json.decode(response.body)['feeds'];
        return Feed.fromJson(data);
      } else {
        Get.snackbar('Error', 'Failed to fetch feed');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
    return null;
  }
}
