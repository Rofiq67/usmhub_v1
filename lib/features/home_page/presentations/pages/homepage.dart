import 'package:flutter/material.dart';
import 'package:usmhub_v1/features/home_page/presentations/widgets/banner_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/home_page/presentations/widgets/info_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                const Text(
                  'Halo, Rofiq',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
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
                    // print('active');
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
                        const Text(
                          'Pengaduan',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
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
                        const Text(
                          'Aspirasi',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
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
            const Text(
              'Informasi',
              style: TextStyle(
                color: Color(0xFF1C1C1C),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 0.48,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const InfoWidget(
                labelTxt: 'Aspirasi',
                judulTxt: 'Taman Inspiratif: Semangat Berkarya Mahasiswa',
                dateTxt: '5 Maret 2024',
                imgInfo: 'assets/images/taman_usm.png'),
            const SizedBox(
              height: 8,
            ),
            const InfoWidget(
                labelTxt: 'Pengaduan',
                judulTxt: 'Update Lahan Parkir',
                dateTxt: '28 Februari 2024',
                imgInfo: 'assets/images/parkir_usm.png'),
            const SizedBox(
              height: 8,
            ),
            const InfoWidget(
                labelTxt: 'Aspirasi',
                judulTxt: 'Dialog Mahasiswa',
                dateTxt: '5 Februari 2024',
                imgInfo: 'assets/images/dm_mahasiswa.png')
          ],
        ),
      ),
    ));
  }
}
