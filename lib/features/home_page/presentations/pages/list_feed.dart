import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:usmhub_v1/features/home_page/domains/controllers/home_controller.dart';
import 'package:usmhub_v1/features/home_page/presentations/pages/detail_feed.dart';
import 'package:usmhub_v1/features/home_page/presentations/widgets/info_widget.dart';

class ListFeed extends StatefulWidget {
  const ListFeed({super.key});

  @override
  State<ListFeed> createState() => _ListFeedState();
}

class _ListFeedState extends State<ListFeed> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Informasi',
          style: GoogleFonts.poppins(
            color: const Color(0xFF1C1C1C),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 0.32,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Iconsax.arrow_left),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
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
                      dateTxt: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                          .format(feed.createdAt),
                      imgInfo: 'assets/images/taman_usm.png',
                      onPressed: () {
                        Get.to(() => DetailFeed(
                              feedId: feed.id,
                            ));
                      },
                    );
                  }).toList(),
                );
              }),
              const SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}
