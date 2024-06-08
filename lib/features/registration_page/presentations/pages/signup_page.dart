// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/registration_page/domains/controllers/auth.dart';
import 'package:usmhub_v1/features/registration_page/presentations/pages/login_page.dart';
import 'package:usmhub_v1/features/registration_page/presentations/widgets/dropdown_btn.dart';
import 'package:usmhub_v1/features/registration_page/presentations/widgets/input_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _first_nameController = TextEditingController();
  final TextEditingController _last_nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _progdiController = TextEditingController();
  final TextEditingController _tgl_lahirController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());

  DateTime _selectedDate = DateTime.now();
  String? _selectedProgdi;
  String? _selectedGender;

  String? imgProfil;

  // Fungsi untuk menampilkan date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      _tgl_lahirController.text = picked
          .toString()
          .split(' ')[0]; // Atur tanggal yang dipilih pada input controller
    }
  }

  static const progdiOptions = [
    'Teknik Informatika',
    'Sistem Informasi',
    'Ilmu Komunikasi',
    'Pariwisata',
  ];

  static const genderOptions = [
    'Laki-laki',
    'Perempuan',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Pendaftaran',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 0.48,
              ),
            ),
            const SizedBox(
              height: 8,
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
              height: 24,
            ),
            Form(
              child: Column(
                children: [
                  // First and last name fields
                  Row(
                    children: [
                      Expanded(
                        child: InputWidget(
                          hintTxt: 'Depan',
                          controller: _first_nameController,
                          obsureTxt: false,
                          prefixIcon: Iconsax.user,
                          sizeTxt: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: InputWidget(
                          hintTxt: 'Belakang',
                          controller: _last_nameController,
                          obsureTxt: false,
                          prefixIcon: Iconsax.user,
                          sizeTxt: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
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
                    hintTxt: 'Email',
                    controller: _emailController,
                    obsureTxt: false,
                    prefixIcon: Iconsax.direct,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputWidget(
                    hintTxt: 'Password',
                    controller: _passwordController,
                    obsureTxt: true,
                    prefixIcon: Iconsax.password_check,
                    suffixIcon: Iconsax.eye_slash,
                  ),
                  const SizedBox(height: 8),
                  InputWidget(
                    hintTxt: 'Tanggal Lahir',
                    controller: _tgl_lahirController,
                    obsureTxt: false,
                    prefixIcon: Iconsax.calendar,
                    onTap: () => _selectDate(context),
                    read: true,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DropdownBtn(
                    hint: 'Program Studi',
                    value: _selectedProgdi,
                    items: progdiOptions,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedProgdi = newValue!;
                      });
                    },
                    prefixIcon: Iconsax.teacher,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DropdownBtn(
                    hint: 'Jenis Kelamin',
                    value: _selectedGender,
                    items: genderOptions,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedGender = newValue!;
                      });
                    },
                    prefixIcon: Iconsax.man,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _authController.register(
                        first_name: _first_nameController.text.trim(),
                        last_name: _last_nameController.text.trim(),
                        username: _usernameController.text.trim(),
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                        tgl_lahir: _selectedDate,
                        progdi: _selectedProgdi ?? '',
                        gender: _selectedGender ?? '',
                        img_profil: imgProfil,
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
                              'Daftar',
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
                      Get.to(const LoginPage());
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 8),
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Sudah memiliki akun? ',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                                letterSpacing: 0.24,
                              ),
                            ),
                            TextSpan(
                              text: 'Masuk',
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
          ]),
        ),
      ),
    );
  }
}
