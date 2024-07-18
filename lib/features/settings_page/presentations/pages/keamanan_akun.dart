// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/registration_page/domains/controllers/auth.dart';
import 'package:usmhub_v1/features/settings_page/presentations/widgets/input_widget.dart';

class KeamananAkun extends StatefulWidget {
  const KeamananAkun({super.key});

  @override
  State<KeamananAkun> createState() => _KeamananAkunState();
}

class _KeamananAkunState extends State<KeamananAkun> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final AuthController _authController = Get.find<
      AuthController>(); // Ensure AuthController is properly initialized

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Iconsax.arrow_left),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffF5F5F5),
        title: Text(
          'Keamanan Akun',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: const Color(0xFF1C1C1C),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 0.32,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              'Ganti Kata Sandi',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 0.48,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Masukkan Kata Sandi Baru dan Konfirmasi',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.32,
              ),
            ),
            const SizedBox(height: 32),
            Form(
              child: Column(
                children: [
                  InputWidget(
                    hintTxt: 'Kata Sandi Baru',
                    controller: _passwordController,
                    obscureTxt: !_passwordVisible,
                    prefixIcon: Iconsax.lock,
                    suffixIcon:
                        _passwordVisible ? Iconsax.eye : Iconsax.eye_slash,
                    onTapSuffix: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  InputWidget(
                    hintTxt: 'Konfirmasi Kata Sandi Baru',
                    controller: _confirmPasswordController,
                    obscureTxt: !_confirmPasswordVisible,
                    prefixIcon: Iconsax.lock,
                    suffixIcon: _confirmPasswordVisible
                        ? Iconsax.eye
                        : Iconsax.eye_slash,
                    onTapSuffix: () {
                      setState(() {
                        _confirmPasswordVisible = !_confirmPasswordVisible;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      String password = _passwordController.text.trim();
                      String confirmPassword =
                          _confirmPasswordController.text.trim();

                      if (password.isNotEmpty && confirmPassword.isNotEmpty) {
                        if (password == confirmPassword) {
                          _authController
                              .updatePassword(
                                  password: password,
                                  password_confirmation: confirmPassword)
                              .then((_) {
                            _passwordController.clear();
                            _confirmPasswordController.clear();
                          }).catchError((error) {
                            Get.snackbar(
                              'Error',
                              'Gagal update password: $error',
                            );
                          });
                        } else {
                          Get.snackbar(
                            'Error',
                            'Password Tidak Sama',
                          );
                        }
                      } else {
                        Get.snackbar(
                          'Error',
                          'Pastikan sudah terisi semuanya',
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3E4095),
                      fixedSize: const Size(353, 60),
                    ),
                    child: Text(
                      'Ganti Kata Sandi',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFFF9F9F9),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
