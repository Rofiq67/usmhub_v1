import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/aspirasi_page/presentations/pages/aspirasi.dart';
import 'package:usmhub_v1/features/home_page/domains/controllers/home_controller.dart';
import 'package:usmhub_v1/features/home_page/presentations/widgets/banner_widget.dart';
import 'package:usmhub_v1/features/home_page/presentations/widgets/info_widget.dart';
import 'package:usmhub_v1/features/pengaduan_page/presentations/pages/pengaduan.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Halo, Rofiq',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.32,
                  ),
                ),
                Container(
                  width: 52,
                  height: 52,
                  padding: const EdgeInsets.all(10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/pp_mahasiswa.png'),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 10,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            const BannerWidget(),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => const Pengaduan());
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: 167,
                    height: 54,
                    decoration: BoxDecoration(
                      color: const Color(0xffEEEFF8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 39,
                          height: 39,
                          // padding: const EdgeInsets.only(left: 25),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFBCBEF3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: const Icon(
                            Iconsax.microphone,
                            color: Color(0xff3E4095),
                          ),
                        ),
                        Text(
                          'Pengaduan',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.28,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // print('active');
                    Get.to(() => const AspirasiPage());
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: 167,
                    height: 54,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFCFBE2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 39,
                          height: 39,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFEFBB9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: const Icon(
                            Iconsax.lamp_on5,
                            color: Color(0xffFFB800),
                          ),
                        ),
                        Text(
                          'Aspirasi',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.28,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Informasi',
              style: GoogleFonts.poppins(
                color: Color(0xFF1C1C1C),
                fontSize: 24,
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 0.48,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Obx(() {
              if (homeController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (homeController.feeds.isEmpty) {
                return const Center(child: Text('No feeds available'));
              }
              return Column(
                children: homeController.feeds.map((feed) {
                  return InfoWidget(
                    labelTxt: feed.kategori,
                    judulTxt: feed.judul,
                    dateTxt: feed.createdAt.toLocal().toString(),
                    imgInfo: 'assets/images/taman_usm.png',
                  );
                }).toList(),
              );
            }),
          ],
        ),
      ),
    ));
  }
}
