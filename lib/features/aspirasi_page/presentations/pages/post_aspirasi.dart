// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:usmhub_v1/features/aspirasi_page/data/models/aspirasi_models.dart';
// import 'package:usmhub_v1/features/aspirasi_page/presentations/pages/form_aspirasi1.dart';
// import 'package:usmhub_v1/features/aspirasi_page/presentations/pages/form_aspirasi2.dart';
// import 'package:usmhub_v1/features/aspirasi_page/presentations/pages/form_aspirasi3.dart';
// import 'package:usmhub_v1/features/aspirasi_page/domains/controllers/aspirasi_controller.dart';

// class PostAspirasi extends StatefulWidget {
//   const PostAspirasi({Key? key}) : super(key: key);

//   @override
//   State<PostAspirasi> createState() => _PostAspirasiState();
// }

// class _PostAspirasiState extends State<PostAspirasi> {
//   final PageController _pageController = PageController();
//   final AspirasiController aspirasiController = Get.put(AspirasiController());
//   final String? token = GetStorage().read('token');

//   final TextEditingController jenisAspirasiController = TextEditingController();
//   final TextEditingController programStudiController = TextEditingController();
//   final TextEditingController keteranganController = TextEditingController();
//   double rating = 0;
//   String? selectedKategori;
//   String? selectedProgdi;
//   bool isDataComplete = false;

//   void onRatingChanged(double newRating) {
//     setState(() {
//       rating = newRating;
//       checkDataCompletion();
//     });
//   }

//   void onSelectedKategoriChanged(String? newKategori) {
//     setState(() {
//       selectedKategori = newKategori;
//       checkDataCompletion();
//     });
//   }

//   void onSelectedProgdiChanged(String? newProgdi) {
//     setState(() {
//       selectedProgdi = newProgdi;
//       checkDataCompletion();
//     });
//   }

//   void checkDataCompletion() {
//     if (jenisAspirasiController.text.isNotEmpty &&
//         selectedKategori != null &&
//         programStudiController.text.isNotEmpty &&
//         keteranganController.text.isNotEmpty &&
//         rating > 0) {
//       setState(() {
//         isDataComplete = true;
//       });
//     } else {
//       setState(() {
//         isDataComplete = false;
//       });
//     }
//   }

//   void handleSubmit() {
//     if (isDataComplete) {
//       final String token = GetStorage().read('token') ?? '';
//       if (token.isEmpty) {
//         return;
//       }
//       final userId = int.tryParse(token);
//       if (userId == null) {
//         return;
//       }
//       final aspirasi = Aspirasi(
//         id: 0,
//         userId: userId,
//         jenisAspirasi: jenisAspirasiController.text,
//         programStudi: selectedProgdi ?? '',
//         keterangan: keteranganController.text,
//         rating: rating.toInt(),
//       );
//       aspirasiController.createAspirasi(aspirasi, token);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: const Color(0xfff5f5f5),
//         leading: const Padding(
//           padding: EdgeInsets.only(left: 20),
//           child: Icon(Iconsax.arrow_left),
//         ),
//       ),
//       body: Stack(
//         children: [
//           PageView(
//             controller: _pageController,
//             children: [
//               FormAspirasi1(
//                 controller: jenisAspirasiController,
//                 selectedKategori: selectedKategori,
//                 onSelectedKategoriChanged: onSelectedKategoriChanged,
//               ),
//               FormAspirasi2(
//                 controller: programStudiController,
//                 selectedProgdi: selectedProgdi,
//                 onSelectedProgdiChanged: onSelectedProgdiChanged,
//               ),
//               FormAspirasi3(
//                 keteranganController: keteranganController,
//                 onRatingChanged: onRatingChanged,
//               ),
//             ],
//           ),
//           Positioned(
//             bottom: 64,
//             left: 20,
//             child: SmoothPageIndicator(
//               controller: _pageController,
//               onDotClicked: (index) => _pageController.animateToPage(index,
//                   duration: const Duration(milliseconds: 500),
//                   curve: Curves.easeInOut),
//               count: 3,
//               effect: const ExpandingDotsEffect(
//                 activeDotColor: Color(0xff3E4095),
//                 dotColor: Color(0xff757F90),
//                 dotHeight: 6,
//                 dotWidth: 6,
//                 expansionFactor: 4,
//                 spacing: 4,
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 32,
//             right: 20,
//             child: ElevatedButton(
//               onPressed: isDataComplete ? handleSubmit : null,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor:
//                     isDataComplete ? const Color(0xff3E4095) : Colors.grey,
//                 fixedSize: const Size(52, 52),
//                 shape: const CircleBorder(),
//                 padding: const EdgeInsets.symmetric(horizontal: 5),
//               ),
//               child: const Icon(
//                 Iconsax.arrow_right_3,
//                 color: Color(0xffF5F5F5),
//                 size: 32,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
