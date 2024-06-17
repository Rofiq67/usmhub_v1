import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/settings_page/domains/controllers/settings_controller.dart';
import 'package:usmhub_v1/features/settings_page/presentations/widgets/input_widget.dart';

class KemananAkun extends StatefulWidget {
  const KemananAkun({Key? key}) : super(key: key);

  @override
  State<KemananAkun> createState() => _KemananAkunState();
}

class _KemananAkunState extends State<KemananAkun> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final SettingsController _settingsController = SettingsController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

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
              'Masukkan NIM dan Kata Sandi Baru untuk memperbarui password',
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
                          _settingsController
                              .updatePassword(password, confirmPassword)
                              .then((_) {
                            _passwordController.clear();
                            _confirmPasswordController.clear();
                          }).catchError((error) {
                            Get.snackbar(
                              'Error',
                              'Failed to update password: $error',
                            );
                          });
                        } else {
                          Get.snackbar(
                            'Error',
                            'Password fields do not match',
                          );
                        }
                      } else {
                        Get.snackbar(
                          'Error',
                          'Please fill in all fields',
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3E4095),
                      fixedSize: const Size(353, 60),
                    ),
                    child: Text(
                      'Kirim',
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
