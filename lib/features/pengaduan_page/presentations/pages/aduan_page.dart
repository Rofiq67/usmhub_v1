// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:usmhub_v1/features/pengaduan_page/data/models/aduan_models.dart';
// import 'package:usmhub_v1/features/pengaduan_page/domains/controllers/aduan_controller.dart';
// import 'package:usmhub_v1/features/progress_page/presentations/widgets/card_progress.dart';

// class AduanPage extends StatefulWidget {
//   const AduanPage({Key? key}) : super(key: key);

//   @override
//   _AduanPageState createState() => _AduanPageState();
// }

// class _AduanPageState extends State<AduanPage> {
//   final AduanController aduanController = Get.put(AduanController());
//   final TextEditingController jenisPengaduanController =
//       TextEditingController();
//   final TextEditingController programStudiController = TextEditingController();
//   final TextEditingController keteranganController = TextEditingController();
//   final TextEditingController ratingController = TextEditingController();
//   File? _buktiPhoto;
//   final ImagePicker _picker = ImagePicker();
//   final _formKey = GlobalKey<FormState>();
//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _buktiPhoto = File(pickedFile.path);
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     aduanController.fetchRiwayatPengaduan(GetStorage().read('token') ?? '');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Aduan Page'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 TextField(
//                   controller: jenisPengaduanController,
//                   decoration:
//                       const InputDecoration(labelText: 'Jenis Pengaduan'),
//                 ),
//                 TextField(
//                   controller: programStudiController,
//                   decoration: const InputDecoration(labelText: 'Program Studi'),
//                 ),
//                 TextField(
//                   controller: keteranganController,
//                   decoration: const InputDecoration(labelText: 'Keterangan'),
//                 ),
//                 TextField(
//                   controller: ratingController,
//                   decoration: const InputDecoration(labelText: 'Rating'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     await _pickImage();
//                   },
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.photo,
//                         color: Colors.white,
//                       ),
//                       const SizedBox(width: 16),
//                       Text(
//                         _buktiPhoto != null ? 'Change Photo' : 'Pick Photo',
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     if (_buktiPhoto == null) {
//                       // Show snackbar if photo is not picked
//                       Get.snackbar(
//                         'Error',
//                         'Please pick a photo',
//                         snackPosition: SnackPosition.TOP,
//                       );
//                       return;
//                     }

//                     if (_buktiPhoto!.path.isNotEmpty &&
//                         _formKey.currentState!.validate()) {
//                       Aduan aduan = Aduan(
//                         jenisPengaduan: jenisPengaduanController.text,
//                         programStudi: programStudiController.text,
//                         keterangan: keteranganController.text,
//                         rating: int.tryParse(ratingController.text) ?? 0,
//                         buktiPhoto: _buktiPhoto!.path,
//                         userId: 0, // Update with appropriate value
//                         status: 'Belum dibaca', // Update with appropriate value
//                         createdAt:
//                             DateTime.now(), // Update with appropriate value
//                         updatedAt: DateTime.now(),
//                         id: 0, // Update with appropriate value
//                       );

//                       await aduanController.createPengaduan(
//                           aduan, GetStorage().read('token') ?? '');

//                       // Clear form fields after successful submission
//                       jenisPengaduanController.clear();
//                       programStudiController.clear();
//                       keteranganController.clear();
//                       ratingController.clear();
//                       setState(() {
//                         _buktiPhoto = null;
//                       });

//                       // Refresh list of complaints after successful submission
//                       aduanController.fetchRiwayatPengaduan(
//                           GetStorage().read('token') ?? '');
//                     }
//                   },
//                   child: const Text('Submit Complaint'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     // Refresh list of complaints
//                     aduanController.fetchRiwayatPengaduan(
//                         GetStorage().read('token') ?? '');
//                   },
//                   child: const Text('Refresh Complaint History'),
//                 ),
//                 Obx(
//                   () => Column(
//                     children: aduanController.riwayatPengaduan.map((aduan) {
//                       return CardProgress(
//                         iconCard: Icons.photo,
//                         colorIconCard: const Color(0xff3E4095),
//                         bgIconCard: const Color(0xFFBCBEF3),
//                         jdlCard: aduan.jenisPengaduan,
//                         stsCard: aduan.status,
//                         dateCard: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
//                             .format(aduan.createdAt),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
