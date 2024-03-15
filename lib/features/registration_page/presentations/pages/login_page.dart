import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/images/usmhub2.svg'),
            const SizedBox(
              height: 32,
            ),
            const Text(
              'Selamat datang',
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
              height: 8,
            ),
            const SizedBox(
              width: double.maxFinite,
              child: Text(
                'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.32,
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Form(
                child: SizedBox(
              width: double.maxFinite,
              // height: 60,
              // padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  TextFormField(
                    maxLength: 10,
                    style: const TextStyle(
                      color: Color(0xff3E4095),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.32,
                    ),
                    decoration: InputDecoration(
                      // isDense: true,
                      counterText: "",
                      prefixIconColor: const Color(0xff3E4095),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: SvgPicture.asset('assets/icons/user_bold.svg'),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff3E4095)),
                          borderRadius: BorderRadius.all(Radius.circular(29))),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff3E4095)),
                          borderRadius: BorderRadius.all(Radius.circular(29))),
                      hintText: 'NIM (B123445678)',
                      hintStyle: const TextStyle(
                        color: Color(0xFF757F90),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      color: Color(0xff3E4095),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.32,
                    ),
                    decoration: const InputDecoration(
                      prefixIconColor: Color(0xff3E4095),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Icon(Iconsax.password_check),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 23),
                        child: Icon(
                          Iconsax.eye_slash,
                          color: Color(0xff3E4095),
                          size: 23,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff3E4095)),
                          borderRadius: BorderRadius.all(Radius.circular(29))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff3E4095)),
                          borderRadius: BorderRadius.all(Radius.circular(29))),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Color(0xFF757F90),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            activeColor: const Color(0xff3E4095),
                            value: true,
                            onChanged: (value) {},
                          ),
                          const Text(
                            'Ingatkan saya',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 0.24,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Lupa sandi?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.24,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3E4095),
                      fixedSize: const Size(353, 60),
                    ),
                    child: const Text(
                      'Masuk',
                      style: TextStyle(
                        color: Color(0xFFF9F9F9),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF5F5F5),
                        fixedSize: const Size(353, 60),
                        side: const BorderSide(
                          strokeAlign: 2,
                          color: Color(0xff3E4095),
                        )),
                    child: const Text(
                      'Daftar',
                      style: TextStyle(
                        color: Color(0xff3e4095),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                    ),
                  ),
                ],
              ),
            )),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    child: Divider(
                  color: Color(0xFF757F90),
                  thickness: 0.5,
                  indent: 60,
                  endIndent: 15,
                )),
                Text(
                  'atau masuk ',
                  style: TextStyle(
                    color: Color(0xFF757F90),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.24,
                  ),
                ),
                Flexible(
                    child: Divider(
                  color: Color(0xFF757F90),
                  thickness: 0.5,
                  indent: 15,
                  endIndent: 60,
                )),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                      onPressed: () {
                        // print('active');
                      },
                      icon: SvgPicture.asset('assets/images/google_logo.svg')),
                ),
                const SizedBox(
                  width: 32,
                ),
                Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                      onPressed: () {
                        // print('active');
                      },
                      icon: SvgPicture.asset('assets/images/apple_logo.svg')),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
