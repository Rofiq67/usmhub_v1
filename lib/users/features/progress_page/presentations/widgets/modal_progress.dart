// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/users/features/progress_page/presentations/widgets/card_comment.dart';

class ModalProgress extends StatefulWidget {
  const ModalProgress({super.key});

  @override
  State<ModalProgress> createState() => _ModalProgressState();
}

class _ModalProgressState extends State<ModalProgress> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              width: double.maxFinite,
              height: 600,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Komentar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: 0.48,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: 37,
                            height: 37,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF3E4095),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '3',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                  letterSpacing: 0.48,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 142,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 32,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const CardComment(
                    imgProfile: 'assets/images/profil_admin.png',
                    nameUser: 'Admin',
                    dateChat: '5 Min lalu',
                    isiComment:
                        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia.',
                  ),
                  const CardComment(
                    imgProfile: 'assets/images/pp_mhs.png',
                    nameUser: 'Rofiq',
                    dateChat: '5 Min lalu',
                    isiComment:
                        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia.',
                  ),
                  const CardComment(
                    imgProfile: 'assets/images/profil_admin.png',
                    nameUser: 'Admin',
                    dateChat: '5 Min lalu',
                    isiComment:
                        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia.',
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: TextField(),
                  )
                ],
              ),
            );
          },
        );
      },
      backgroundColor: const Color(0xff3E4095),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: const Icon(
        Iconsax.message,
        color: Color(0xfff5f5f5),
      ),
    );
  }
}
