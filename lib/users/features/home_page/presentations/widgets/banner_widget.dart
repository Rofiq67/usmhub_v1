import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final imgBanner = [
    SvgPicture.asset('assets/images/banner1.svg'),
    SvgPicture.asset('assets/images/banner2.svg'),
  ];
int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imgBanner,
          options: CarouselOptions(
            autoPlay: true,
            height: 155,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            reverse: false,
            enlargeCenterPage: true,
            enlargeFactor: 0.5,
            disableCenter: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                myCurrentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        AnimatedSmoothIndicator(
          activeIndex: myCurrentIndex,
          count: imgBanner.length,
          effect: const ExpandingDotsEffect(
            activeDotColor: Color(0xff3E4095),
            dotColor: Color(0xff757F90),
            dotHeight: 6,
            dotWidth: 6,
            expansionFactor: 4,
            spacing: 4,
          ),
        )
      ],
    );
  }
}
