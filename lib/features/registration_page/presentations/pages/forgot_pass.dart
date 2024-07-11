import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/registration_page/domains/controllers/auth.dart';
import 'package:usmhub_v1/features/registration_page/presentations/pages/signup_page.dart';
import 'package:usmhub_v1/features/registration_page/presentations/widgets/input_widget.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final AuthController authController = Get.find<AuthController>();

  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xfff5f5f5),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Icon(Iconsax.arrow_left),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Lupa Kata Sandi',
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
                    'Masukan Username yang terdaftar untuk pencocokan, dan masukan kata sandi baru',
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
                    child: Column(
                      children: [
                        //input
                        InputWidget(
                          hintTxt: 'Masukan NIM',
                          controller: usernameController,
                          obscureTxt: false,
                          prefixIcon: Iconsax.user,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        InputWidget(
                          hintTxt: 'Password Baru',
                          controller: passwordController,
                          obscureTxt: _passwordVisible,
                          prefixIcon: Iconsax.password_check,
                          suffixIcon: _passwordVisible
                              ? Iconsax.eye_slash
                              : Iconsax.eye,
                          onTapSuffix: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        InputWidget(
                          hintTxt: 'Konfirmasi Password Baru',
                          controller: passwordConfirmController,
                          obscureTxt: _passwordVisible,
                          prefixIcon: Iconsax.password_check,
                          suffixIcon: _passwordVisible
                              ? Iconsax.eye_slash
                              : Iconsax.eye,
                          onTapSuffix: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),

                        const SizedBox(
                          height: 32,
                        ),
                        //btn
                        ElevatedButton(
                          onPressed: () async {
                            if (passwordController.text ==
                                passwordConfirmController.text) {
                              await authController.forgotPassword(
                                username: usernameController.text,
                                password_baru: passwordController.text,
                                password_baru_confirmation:
                                    passwordConfirmController.text,
                              );
                            } else {
                              Get.snackbar(
                                'Gagal',
                                'Passwords Tidak Sama',
                                snackPosition: SnackPosition.TOP,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 16),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                              color: Color(0xff3E4095),
                              width: 2,
                            ),
                            backgroundColor: const Color(0xff3E4095),
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 60),
                          ),
                          child: Obx(() {
                            return authController.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    'Ganti Kata Sandi',
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
                        InkWell(
                          onTap: () {
                            Get.to(() => const SignupPage());
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 8),
                            alignment: Alignment.center,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Belum punya akun? ',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Daftar',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
