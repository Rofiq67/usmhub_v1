// ignore_for_file: file_names
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:usmhub_v1/features/home_page/data/models/feed_models.dart';
// import 'package:usmhub_v1/features/home_page/domains/controllers/home_controller.dart';

// class FeedById extends StatelessWidget {
//   final int feedId;

//   const FeedById({super.key, required this.feedId});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(
//       init: HomeController(), // Inisialisasi HomeController
//       builder: (controller) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text('Detail Feed'),
//           ),
//           body: Center(
//             child: Obx(() {
//               if (controller.isLoading.value) {
//                 return const CircularProgressIndicator();
//               } else {
//                 Feed? feed = controller.feeds
//                     .firstWhereOrNull((feed) => feed.id == feedId);
//                 if (feed == null) {
//                   return const Text('Feed tidak ditemukan');
//                 }
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Kategori: ${feed.kategori}'),
//                     Text('Deskripsi: ${feed.deskripsi}'),
//                     Text('Doc Feed: ${feed.docfeed ?? ''}'),
//                     Text('Img Banner: ${feed.imgbanner ?? ''}'),
//                     Text('Dibuat Pada: ${feed.createdAt.toIso8601String()}'),
//                     Text('User ID: ${feed.userId}'),
//                     ...[
//                       Text(
//                           'Nama Pengguna: ${feed.user.firstName} ${feed.user.lastName}'),
//                       Text('Email Pengguna: ${feed.user.email}'),
//                     ],
//                   ],
//                 );
//               }
//             }),
//           ),
//         );
//       },
//     );
//   }
// }
