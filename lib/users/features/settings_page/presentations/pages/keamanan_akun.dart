import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class KemananAkun extends StatefulWidget {
  const KemananAkun({super.key});

  @override
  State<KemananAkun> createState() => _KemananAkunState();
}

class _KemananAkunState extends State<KemananAkun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(Iconsax.arrow_left),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffF5F5F5),
        title: const Text(
          'Kemanan Akun',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF1C1C1C),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 0.32,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            const Text(
              'Ganti Kata Sandi',
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
              height: 4,
            ),
            const SizedBox(
              width: 352,
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
              height: 64,
            ),
            Form(
              child: Column(
                children: [
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
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3E4095),
                      fixedSize: const Size(353, 60),
                    ),
                    child: const Text(
                      'Kirim',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
