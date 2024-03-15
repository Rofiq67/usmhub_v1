// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

class CardComment extends StatelessWidget {
  final String imgProfile;
  final String nameUser;
  final String dateChat;
  final String isiComment;
  const CardComment(
      {required this.imgProfile,
      required this.nameUser,
      required this.dateChat,
      required this.isiComment,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 53,
            height: 53,
            decoration: ShapeDecoration(
              color: const Color(0xFFD1D2FE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  // 'assets/images/profil_admin.png',
                  imgProfile,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    nameUser,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF1C1C1C),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: 0.32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    dateChat,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF757F90),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.24,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 263,
                child: Text(
                  isiComment,
                  style: const TextStyle(
                    color: Color(0xFF1C1C1C),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.28,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  // print('active');
                },
                child: const Text(
                  'Balas',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF757F90),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.32,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
