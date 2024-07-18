import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:usmhub_v1/controllers/getfile_controller.dart';
import 'package:usmhub_v1/features/registration_page/domains/controllers/auth.dart';
import 'package:usmhub_v1/features/settings_page/presentations/pages/edit_profile.dart';
import 'package:usmhub_v1/features/settings_page/presentations/widgets/card_profile.dart';

// ignore: use_key_in_widget_constructors
class ProfilePage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final GetfileController getFileController = Get.find();

  String _formatDate(DateTime? date) {
    if (date != null) {
      return DateFormat('dd MMMM yyyy', 'id_ID').format(date);
    } else {
      return ''; // Or any default value you prefer when date is null
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF5F5F5),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Iconsax.arrow_left),
          ),
        ),
        title: Text(
          'Profil',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: const Color(0xFF1C1C1C),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 0.32,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Get.to(() => const EditProfile());
            },
            child: Text(
              'Ubah',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.28,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 64),
            Center(
              child: Container(
                width: 108,
                height: 108,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  // color: const Color(0xFFEBECEC),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 10,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Obx(() {
                    var userProfile = authController.userProfile.value;

                    if (userProfile['img_profile'] != null &&
                        userProfile['img_profile'].toString().isNotEmpty) {
                      // Menggunakan FutureBuilder untuk menampilkan gambar dari getImage
                      return FutureBuilder<Uint8List?>(
                        future: getFileController
                            .getImage(userProfile['img_profile'].toString()),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            print('Error fetching image: ${snapshot.error}');
                            return Image.asset(
                              'assets/images/pp_mhs.png',
                              fit: BoxFit.cover,
                            );
                          } else if (snapshot.hasData &&
                              snapshot.data != null) {
                            try {
                              return Image.memory(
                                snapshot.data!,
                                fit: BoxFit.cover,
                              );
                            } catch (e) {
                              print('Error displaying image: $e');
                              return Image.asset(
                                'assets/images/pp_mhs.png',
                                fit: BoxFit.cover,
                              );
                            }
                          } else {
                            return Image.asset(
                              'assets/images/pp_mhs.png',
                              fit: BoxFit.cover,
                            );
                          }
                        },
                      );
                    } else {
                      // jika tidak ada data photo profile
                      return Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Iconsax.user,
                          size: 40,
                          color: Color(0xFF757F90),
                        ),
                      );
                    }
                  }),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.maxFinite,
              height: 340,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Obx(() {
                // ignore: invalid_use_of_protected_member
                var userProfile = authController.userProfile.value;
                return Column(
                  children: [
                    CardProfile(
                      txtCard:
                          '${userProfile['first_name']} ${userProfile['last_name']}',
                      iconData: Iconsax.user,
                    ),
                    CardProfile(
                      txtCard: userProfile['email'],
                      iconData: Iconsax.direct,
                    ),
                    CardProfile(
                      txtCard: userProfile['username'],
                      iconData: Iconsax.user_tag,
                    ),
                    CardProfile(
                      txtCard:
                          _formatDate(DateTime.parse(userProfile['tgl_lahir'])),
                      iconData: Iconsax.calendar,
                    ),
                    CardProfile(
                      txtCard: userProfile['progdi'],
                      iconData: Iconsax.teacher,
                    ),
                    CardProfile(
                      txtCard: userProfile['gender'],
                      iconData: Iconsax.man,
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
