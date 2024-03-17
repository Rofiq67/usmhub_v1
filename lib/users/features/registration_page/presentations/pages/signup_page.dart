import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pendaftaran',
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
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        style: const TextStyle(
                          color: Color(0xff3E4095),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.26,
                        ),
                        expands: false,
                        decoration: InputDecoration(
                          prefixStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child:
                                SvgPicture.asset('assets/icons/user_bold.svg'),
                          ),
                          prefixIconColor: const Color(0xff3E4095),
                          hintText: 'Nama Depan',
                          hintStyle: const TextStyle(
                            color: Color(0xFF757F90),
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.26,
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xff3E4095)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(29))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xff3E4095)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(29))),
                        ),
                      )),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: TextFormField(
                        style: const TextStyle(
                          color: Color(0xff3E4095),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.26,
                        ),
                        expands: false,
                        decoration: InputDecoration(
                          prefixStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child:
                                SvgPicture.asset('assets/icons/user_bold.svg'),
                          ),
                          prefixIconColor: const Color(0xff3E4095),
                          hintText: 'Nama Belakang',
                          hintStyle: const TextStyle(
                            color: Color(0xFF757F90),
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.26,
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xff3E4095)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(29))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xff3E4095)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(29))),
                        ),
                      )),
                    ],
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
                    decoration: InputDecoration(
                      // isDense: true,
                      prefixIconColor: const Color(0xff3E4095),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: SvgPicture.asset('assets/icons/user_nim.svg'),
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
                      // isDense: true,
                      prefixIconColor: Color(0xff3E4095),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Icon(
                          Iconsax.direct,
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
                      hintText: 'E-mail',
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
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          activeColor: const Color(0xff3E4095),
                          value: true,
                          onChanged: (value) {},
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'I agree to',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.24,
                              ),
                            ),
                            TextSpan(
                              text: ' Privacy,',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.black,
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                                letterSpacing: 0.24,
                              ),
                            ),
                            TextSpan(
                              text: ' Policy,',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.black,
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                                letterSpacing: 0.24,
                              ),
                            ),
                            TextSpan(
                              text: ' and ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.24,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms of use ',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.black,
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                                letterSpacing: 0.24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3E4095),
                      fixedSize: const Size(353, 60),
                    ),
                    child: const Text(
                      'Daftar',
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
                ],
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
                    'atau daftar',
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
      ),
    );
  }
}
