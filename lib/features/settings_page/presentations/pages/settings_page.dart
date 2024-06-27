// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/registration_page/domains/controllers/auth.dart';
import 'package:usmhub_v1/features/settings_page/presentations/pages/about_me.dart';
import 'package:usmhub_v1/features/settings_page/presentations/pages/keamanan_akun.dart';
import 'package:usmhub_v1/features/settings_page/presentations/pages/profile_page.dart';
import 'package:usmhub_v1/features/settings_page/presentations/pages/report_bug.dart';
import 'package:usmhub_v1/features/settings_page/presentations/pages/syarat_ketentuan.dart';
import 'package:usmhub_v1/features/settings_page/presentations/widgets/card_settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void logout() {
    // Panggil fungsi logout dari AuthController
    Get.find<AuthController>().logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 64,
            ),
            Text(
              'Settings',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 0.48,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 10),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  CardSettings(
                    iconSVg: 'assets/icons/user_bold.svg',
                    txtCard: 'Profil',
                    onPress: () {
                      Get.to(() => ProfilePage());
                    },
                  ),
                  CardSettings(
                    iconData: Iconsax.lock,
                    txtCard: 'Keamanan Akun',
                    onPress: () {
                      Get.to(() => const KeamananAkun());
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 10),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  CardSettings(
                    iconData: Iconsax.flag_2,
                    txtCard: 'Laporkan Bug',
                    onPress: () {
                      Get.to(() => const ReportBug());
                    },
                  ),
                  CardSettings(
                    iconData: Iconsax.info_circle,
                    txtCard: 'Syarat & Ketentuan',
                    onPress: () {
                      Get.to(() => const SyaratKetentuan());
                    },
                  ),
                  CardSettings(
                    iconSVg: 'assets/images/usmhub_nobg.svg',
                    txtCard: 'Tentang Kami',
                    onPress: () {
                      Get.to(() => const AboutMe());
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 10),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  CardSettings(
                    iconData: Iconsax.logout,
                    colorIcon: const Color(0xffCA2020),
                    txtCard: 'Keluar akun',
                    onPress: () {
                      logout(); // Panggil fungsi logout saat card ditekan
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
