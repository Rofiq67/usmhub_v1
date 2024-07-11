import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/registration_page/domains/controllers/auth.dart';
import 'package:usmhub_v1/features/registration_page/presentations/pages/forgot_pass.dart';
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
  final AuthController _authController = Get.put(AuthController());

  bool _passwordVisible = true;

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
                  'satu langkah untuk menuju hal yang terbaik',
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
                      obscureTxt: false,
                      prefixIcon: Iconsax.user,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InputWidget(
                      hintTxt: 'Password',
                      controller: _passwordController,
                      obscureTxt: _passwordVisible,
                      prefixIcon: Iconsax.password_check,
                      suffixIcon:
                          _passwordVisible ? Iconsax.eye_slash : Iconsax.eye,
                      onTapSuffix: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),

                    //remember me
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            Get.to(() => const ForgotPass());
                          },
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
                    ElevatedButton(
                      onPressed: () async {
                        await _authController.loginApi(
                          username: _usernameController.text.trim(),
                          password: _passwordController.text.trim(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          color: Color(0xff3E4095),
                          width: 2,
                        ),
                        backgroundColor: const Color(0xff3E4095),
                        fixedSize: Size(MediaQuery.of(context).size.width, 60),
                      ),
                      child: Obx(() {
                        return _authController.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                'Login',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                  letterSpacing: 0.32,
                                ),
                              );
                      }),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BtnWidget(
                      txtBtn: 'Daftar',
                      clrBtn: Colors.white,
                      clrTxt: const Color(0xff3E4095),
                      onPressed: () {
                        Get.to(() => const SignupPage());
                      },
                    )
                  ],
                ),
              )),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
