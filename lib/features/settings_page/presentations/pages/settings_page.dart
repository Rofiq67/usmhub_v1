// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
            const Text(
              'Settings',
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
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(332, 51),
                        backgroundColor: Colors.white,
                        elevation: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/user_bold.svg'),
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              'Profil',
                              style: TextStyle(
                                color: Color(0xFF1C1C1C),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.32,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Iconsax.arrow_right_3,
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(332, 51),
                        backgroundColor: Colors.white,
                        elevation: 0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Iconsax.clock4,
                              size: 25,
                              color: Color(0xff3E4095),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Riwayat Laporan',
                              style: TextStyle(
                                color: Color(0xFF1C1C1C),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.32,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Iconsax.arrow_right_3,
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(332, 51),
                        backgroundColor: Colors.white,
                        elevation: 0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Iconsax.lock,
                              size: 24,
                              color: Color(0xff3E4095),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Keamanan Akun',
                              style: TextStyle(
                                color: Color(0xFF1C1C1C),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.32,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Iconsax.arrow_right_3,
                        )
                      ],
                    ),
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
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(332, 51),
                        backgroundColor: Colors.white,
                        elevation: 0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Iconsax.flag_2,
                              size: 25,
                              color: Color(0xff3E4095),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Laporkan Bug',
                              style: TextStyle(
                                color: Color(0xFF1C1C1C),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.32,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Iconsax.arrow_right_3,
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(332, 51),
                        backgroundColor: Colors.white,
                        elevation: 0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Iconsax.info_circle,
                              size: 25,
                              color: Color(0xff3E4095),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Syarat & Ketentuan',
                              style: TextStyle(
                                color: Color(0xFF1C1C1C),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.32,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Iconsax.arrow_right_3,
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(332, 51),
                        backgroundColor: Colors.white,
                        elevation: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/usmhub_nobg.svg'),
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              'Tentang Kami',
                              style: TextStyle(
                                color: Color(0xFF1C1C1C),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.32,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Iconsax.arrow_right_3,
                        )
                      ],
                    ),
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
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(332, 51),
                        backgroundColor: Colors.white,
                        elevation: 0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Iconsax.logout,
                              size: 25,
                              color: Color(0xffCA2020),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Laporkan Bug',
                              style: TextStyle(
                                color: Color(0xFF1C1C1C),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.32,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Iconsax.arrow_right_3,
                        )
                      ],
                    ),
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
