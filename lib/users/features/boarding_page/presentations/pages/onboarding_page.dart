import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:usmhub_v1/users/features/registration_page/presentations/pages/login_page.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/onboarding.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            // onPageChanged: (index) {
            //   controller.change;
            // },
            children: const [
              OnBoarding(
                imgBoarding: 'assets/images/boarding1.svg',
                tltBoarding: 'Selamat Datang',
                subtltBorading:
                    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia.',
              ),
              OnBoarding(
                imgBoarding: 'assets/images/boarding2.svg',
                tltBoarding: 'Laporkan Aspirasimu',
                subtltBorading:
                    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia.',
              ),
              OnBoarding(
                imgBoarding: 'assets/images/boarding3.svg',
                tltBoarding: 'Wujudkan Bersama',
                subtltBorading:
                    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia.',
              ),
            ],
          ),
          Positioned(
            top: 32,
            right: 20,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Skip',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF757F90),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.28,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 64,
            left: 20,
            child: SmoothPageIndicator(
              controller: _pageController,
              onDotClicked: (index) => _pageController.animateToPage(index,
                  duration: const Duration(microseconds: 500),
                  curve: Curves.bounceOut),
              count: 3,
              effect: const ExpandingDotsEffect(
                activeDotColor: Color(0xff3E4095),
                dotColor: Color(0xff757F90),
                dotHeight: 6,
                dotWidth: 6,
                expansionFactor: 4,
                spacing: 4,
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff3E4095),
                  // maximumSize: Size(52, 52),
                  fixedSize: const Size(52, 52),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 5)),
              child: const Icon(
                Iconsax.arrow_right_3,
                color: Color(0xffF5F5F5),
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
