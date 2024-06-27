import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:flutter_html/flutter_html.dart'; // Import Html widget
import 'package:usmhub_v1/features/home_page/data/models/feed_models.dart';
import 'package:usmhub_v1/features/home_page/domains/controllers/home_controller.dart';

class DetailFeed extends StatelessWidget {
  final int feedId;

  const DetailFeed({super.key, required this.feedId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(), // Initialize HomeController
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
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
          body: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              Feed? feed = controller.feeds
                  .firstWhereOrNull((feed) => feed.id == feedId);
              if (feed == null) {
                return const Center(child: Text('Feed tidak ditemukan'));
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 165,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/taman_usm.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    feed.kategori,
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF757F90),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    feed.judul,
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF1C1C1C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                                        .format(feed.createdAt),
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF757F90),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Author:  ${feed.user.lastName}',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF757F90),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.24,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Html(
                              data: feed.deskripsi,
                              style: {
                                "html": Style(
                                  color: const Color(0xFF1C1C1C),
                                  fontSize: FontSize(16),
                                  textAlign: TextAlign.justify,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.5,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  lineHeight: const LineHeight(1.5),
                                  padding: HtmlPaddings(left: HtmlPadding(0)),
                                ),
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'unduh disini',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFF757F90),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.24,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Iconsax.document_text_1,
                                      color: Color(0xFF1C1C1C),
                                    ),
                                    const SizedBox(width: 6),
                                    Tooltip(
                                      message: feed.docfeed ?? '',
                                      child: Text(
                                        'Download',
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF1C1C1C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.28,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
        );
      },
    );
  }
}
