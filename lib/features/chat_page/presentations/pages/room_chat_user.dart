// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:usmhub_v1/features/chat_page/presentations/widgets/card_bubble_admin.dart';
// import 'package:usmhub_v1/features/chat_page/presentations/widgets/card_bubble_user.dart';
// import 'package:usmhub_v1/features/chat_page/presentations/widgets/card_info_aduan_chat.dart';

// class RoomChatUser extends StatefulWidget {
//   const RoomChatUser({super.key});

//   @override
//   State<RoomChatUser> createState() => _RoomChatUserState();
// }

// class _RoomChatUserState extends State<RoomChatUser> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'Aduan : Lahan Sempit',
//           textAlign: TextAlign.center,
//           style: GoogleFonts.poppins(
//             color: const Color(0xFF1C1C1C),
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             height: 0,
//             letterSpacing: 0.32,
//           ),
//         ),
//         leading: IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             Icons.arrow_back_ios_new_rounded,
//             color: Color(0xff3E4095),
//           ),
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 16.0),
//             child: CircleAvatar(
//               backgroundColor: Color(0xffBDBEF3),
//               child: Icon(
//                 Iconsax.microphone,
//                 color: Color(0xff3E4095),
//               ),
//             ),
//           )
//         ],
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             children: [
//               CardInfoAduanChat(
//                 kategoriAduan: 'Fasilitas',
//                 tujuanAduan: 'Ilmu Komunikasi',
//                 dateAduan: '1 Maret 2024',
//                 imgAduan: 'assets/images/parkir_usm.png',
//                 onpressed: () {},
//               ),
//               const CardBubbleAdmin(
//                 message: 'Halo, apakah benar dengan NIM G211200123?',
//                 time: '12:30 PM',
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 'Senin, 24 Mei 2024',
//                 style: GoogleFonts.poppins(
//                   color: const Color(0xFF1C1C1C),
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                   height: 0,
//                   letterSpacing: 0.24,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const CardBubbleAdmin(
//                 message:
//                     'Bisakah anda mengirimkan bukti photonya?. Terimakasih',
//                 time: '12:30 PM',
//               ),
//               const SizedBox(height: 16),
//               const CardBubbleUser(
//                 message: 'Tentu saja, akan segera saya kirimkan.',
//                 time: '12:31 PM',
//               ),
//               const SizedBox(height: 16),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Container(
//                   padding: const EdgeInsets.all(16),
//                   clipBehavior: Clip.antiAlias,
//                   decoration: const ShapeDecoration(
//                     color: Color(0xFFD0D0D0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(32),
//                         topRight: Radius.circular(32),
//                         bottomLeft: Radius.circular(32),
//                       ),
//                     ),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           showDialog(
//                             context: context,
//                             builder: (context) => Dialog(
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(32),
//                                 child: SizedBox(
//                                   width: MediaQuery.of(context).size.width,
//                                   height: 450,
//                                   child: PhotoView(
//                                     imageProvider: const AssetImage(
//                                         'assets/images/parkir_usm.png'),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(16),
//                           child: Image.asset(
//                             'assets/images/parkir_usm.png',
//                             width: 231,
//                             height: 231,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       const Text(
//                         '12:30 PM',
//                         style: TextStyle(
//                           color: Color(0xFF757F90),
//                           fontSize: 12,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w400,
//                           height: 1.5,
//                           letterSpacing: 0.24,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
