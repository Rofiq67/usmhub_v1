// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:usmhub_v1/controllers/pusher_service.dart';

// class RoomChatUser extends StatefulWidget {
//   const RoomChatUser({super.key});

//   @override
//   State<RoomChatUser> createState() => _RoomChatUserState();
// }

// class _RoomChatUserState extends State<RoomChatUser> {
//   List<String> messages = [];
//   late PusherService pusherService;

//   @override
//   void initState() {
//     super.initState();
//     pusherService = PusherService();
//     pusherService.channel.bind('chat-send', (event) {
//       setState(() {
//         messages.add(event?.data ?? 'No message');
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'Room Chat',
//           textAlign: TextAlign.center,
//           style: GoogleFonts.poppins(
//             color: const Color(0xFF1C1C1C),
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios_new_rounded,
//             color: Color(0xff3E4095),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(messages[index]),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               children: [
//                 const Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Ketik pesan Anda...',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: () {
//                     // Kirim pesan ke server
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
