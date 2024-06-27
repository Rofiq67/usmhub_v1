import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:usmhub_v1/constants/constans.dart';
import 'package:usmhub_v1/features/home_page/data/models/feed_models.dart';
import 'package:usmhub_v1/features/settings_page/data/models/user_model.dart';

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
    if (token == null) {
      Get.snackbar('Error', 'Token is not available');
      return;
    }

    try {
      isLoading.value = true;
      var response = await http.get(
        Uri.parse('$url/feeds'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body)['feeds'] as List;
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
      isLoading.value = true;
      var response = await http.get(
        Uri.parse('$url/feeds/$id'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body)[
            'feed']; // Adjust this based on your API response structure
        Feed feed = Feed.fromJson(data);
        // You can now use 'feed' object to display details in UI
        print('Feed by ID: $feed');
        return feed;
      } else {
        Get.snackbar('Error', 'Failed to fetch feed');
        return null;
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      return null;
    } finally {
      isLoading.value = false;
    }
  }
}
