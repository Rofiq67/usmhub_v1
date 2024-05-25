import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/progress_page/presentations/widgets/bubble_chat_admin.dart';
import 'package:usmhub_v1/features/progress_page/presentations/widgets/bubble_chat_user.dart';
import 'package:usmhub_v1/features/progress_page/presentations/widgets/mytextfield.dart';

class RoomChat extends StatelessWidget {
  const RoomChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(Iconsax.arrow_left),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffF5F5F5),
        scrolledUnderElevation: 0,
        title: const Text(
          'Komentar',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF1C1C1C),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 0.32,
          ),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 7),
        child: SizedBox(
          // height: 500,
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              children: const [
                BubbleChatAdmin(),
                BubbleChatUser(),
                BubbleChatUser(),
                BubbleChatAdmin(),
                BubbleChatUser(),
                BubbleChatAdmin(),
                BubbleChatUser(),
                BubbleChatAdmin(),
                BubbleChatUser(),
                BubbleChatAdmin(),
                BubbleChatUser(),
                BubbleChatAdmin(),
                BubbleChatUser(),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: const MyTextField(),
    );
  }
}
