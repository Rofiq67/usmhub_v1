import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/registration_page/presentations/pages/signup_page.dart';
import 'package:usmhub_v1/features/registration_page/presentations/widgets/btn_widget.dart';
import 'package:usmhub_v1/features/registration_page/presentations/widgets/input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/images/usmhub2.svg'),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Selamat datang',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 0.48,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                width: double.maxFinite,
                child: Text(
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia.',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
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
                    //input
                    InputWidget(
                      hintTxt: 'NIM (A123456789)',
                      controller: _usernameController,
                      obsureTxt: false,
                      prefixIcon: Iconsax.user,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InputWidget(
                      hintTxt: 'Password',
                      controller: _passwordController,
                      obsureTxt: false,
                      prefixIcon: Iconsax.password_check,
                      suffixIcon: Iconsax.eye_slash,
                    ),

                    //remember me
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
                            Text(
                              'Ingatkan saya',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.24,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Lupa sandi?',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 12,
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

                    //btn
                    BtnWidget(
                      txtBtn: 'Masuk',
                      clrBtn: const Color(0xff3E4095),
                      onPressed: () {},
                      clrTxt: Colors.white,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BtnWidget(
                      txtBtn: 'Daftar',
                      clrBtn: Colors.white,
                      clrTxt: const Color(0xff3E4095),
                      onPressed: () {
                        Get.to(const SignupPage());
                      },
                    )
                  ],
                ),
              )),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Flexible(
                      child: Divider(
                    color: Color(0xFF757F90),
                    thickness: 0.5,
                    indent: 60,
                    endIndent: 15,
                  )),
                  Text(
                    'atau masuk ',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF757F90),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.24,
                    ),
                  ),
                  const Flexible(
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
                        icon:
                            SvgPicture.asset('assets/images/google_logo.svg')),
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
        ),
      )),
    );
  }
}
