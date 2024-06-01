import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/chat_page/presentations/widgets/card_user_chat.dart';
import 'package:usmhub_v1/features/notification_page/presentations/widgets/notif_container.dart';
// import 'package:iconsax/iconsax.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 64,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pesan',
                  style: GoogleFonts.poppins(
                    color: Color(0xFF1C1C1C),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: 0.48,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.search_normal,
                      color: Color(0xff3E4095),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          CardUserChat(
            jdlAduan: 'Lahan Sempit',
            msgChat:
                'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia.',
            timeChat: '5min',
            valueChat: '3',
            isNew: true,
            onpressed: () {},
          ),
          CardUserChat(
            jdlAduan: 'Jalan Rusak',
            msgChat:
                'Jalan di depan rumah rusak parah dan sulit dilalui kendaraan.',
            timeChat: '2 days ago',
            valueChat: '0',
            isNew: false, // Chat lama
            onpressed: () {},
          ),
        ],
      ),
    );
  }
}
