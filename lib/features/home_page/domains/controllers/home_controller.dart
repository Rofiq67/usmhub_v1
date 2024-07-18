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
    fetchFeeds();
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
        // Sort feeds by createdAt in descending order
        feeds.sort((a, b) => b.createdAt.compareTo(a.createdAt));
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
        var data = json.decode(response.body)['feed'];
        Feed feed = Feed.fromJson(data);
        // ignore: avoid_print
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
