import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:usmhub_v1/controllers/getfile_controller.dart';
import 'package:usmhub_v1/features/aspirasi_page/presentations/pages/aspirasi.dart';
import 'package:usmhub_v1/features/home_page/data/models/feed_models.dart';
import 'package:usmhub_v1/features/home_page/domains/controllers/home_controller.dart';
import 'package:usmhub_v1/features/home_page/presentations/pages/detail_feed.dart';
import 'package:usmhub_v1/features/home_page/presentations/pages/list_feed.dart';
import 'package:usmhub_v1/features/home_page/presentations/widgets/banner_widget.dart';
import 'package:usmhub_v1/features/home_page/presentations/widgets/card_fitur.dart';
import 'package:usmhub_v1/features/home_page/presentations/widgets/circle_user.dart';
import 'package:usmhub_v1/features/home_page/presentations/widgets/info_widget.dart';
import 'package:usmhub_v1/features/pengaduan_page/presentations/pages/pengaduan.dart';
import 'package:usmhub_v1/features/registration_page/domains/controllers/auth.dart';
import 'package:usmhub_v1/features/settings_page/presentations/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Get.put(HomeController());
  final AuthController authController = Get.put(AuthController());
  final GetfileController getFileController = Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authController.loadUserProfile(); // Load user profile after build
      _refreshFeeds(); // Load feeds initially
    });
  }

  Future<void> _refreshFeeds() async {
    await homeController.fetchFeeds(); // Method to fetch feeds from the API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshFeeds,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() {
                        String lastName =
                            authController.userProfile['last_name'] ??
                                'Pengguna'; // Ambil last name dari userProfile
                        return Text(
                          'Halo, $lastName',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.32,
                          ),
                        );
                      }),
                      InkWell(
                        onTap: () {
                          Get.to(() => ProfilePage());
                        },
                        child: CircleUser(
                          imgProfile: authController.userProfile['img_profile'],
                          getImage: getFileController.getImage,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const BannerWidget(),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardFitur(
                        nameFitur: 'Pengaduan',
                        iconFitur: Iconsax.microphone,
                        bgCard: const Color(0xffEEEFF8),
                        clrIcon: const Color(0xff3E4095),
                        bgIcon: const Color(0xFFBCBEF3),
                        onTap: () {
                          Get.to(() => const Pengaduan());
                        },
                      ),
                      CardFitur(
                        nameFitur: 'Aspirasi',
                        iconFitur: Iconsax.lamp_on5,
                        bgCard: const Color(0xFFFCFBE2),
                        clrIcon: const Color(0xffFFB800),
                        bgIcon: const Color(0xFFFEFBB9),
                        onTap: () {
                          Get.to(() => const AspirasiPage());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Informasi',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF1C1C1C),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 0.48,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const ListFeed());
                        },
                        child: Text(
                          'lainnya',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF757F90),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: 0.48,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Obx(() {
                    if (homeController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (homeController.feeds.isEmpty) {
                      return const Center(child: Text('No feeds available'));
                    }

                    // Copy the feeds list and sort it by createdAt date in descending order
                    final sortedFeeds = List<Feed>.from(homeController.feeds)
                      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

                    // Get the latest 3 feeds
                    final latestFeeds = sortedFeeds.take(3).toList();

                    return Column(
                      children: latestFeeds.map((feed) {
                        return InfoWidget(
                          labelTxt: feed.kategori,
                          judulTxt: feed.judul,
                          dateTxt: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                              .format(feed.createdAt),
                          imgInfo: feed.imgbanner.toString(),
                          getImage: getFileController
                              .getImage, // Pass the getImage method
                          onPressed: () {
                            Get.to(() => DetailFeed(feedId: feed.id));
                          },
                        );
                      }).toList(),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
