import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FormPengaduan2 extends StatefulWidget {
  const FormPengaduan2({super.key});

  @override
  State<FormPengaduan2> createState() => _FormPengaduan2State();
}

class _FormPengaduan2State extends State<FormPengaduan2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xfff5f5f5),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(Iconsax.arrow_left),
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
            const SizedBox(
              width: 88,
              height: 88,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '02',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 64,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.01,
                      letterSpacing: 1.28,
                    ),
                  ),
                  SizedBox(height: 29),
                  Divider(
                    height: 20,
                    thickness: 4,
                    indent: 40,
                    endIndent: 10,
                    color: Colors.black,
                  ),
                ],
              ),
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
              height: 32,
            ),
            const TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff3e4095), width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(29),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Color(0xff3E4095)),
                    borderRadius: BorderRadius.all(Radius.circular(29))),
                filled: true,
                fillColor: Color(0xfff5f5f5),
                prefixIconColor: Color(0xff3E4095),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: Icon(
                    Iconsax.direct_right,
                  ),
                ),
                hintText: 'Tuliskan pengaduan',
                hintStyle: TextStyle(
                  color: Color(0xFF757F90),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.32,
                ),
              ),
              maxLines: 7,
              minLines: 1,
              maxLength: 250,
            ),
            const SizedBox(
              height: 210,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff3E4095),
                fixedSize: const Size(353, 60),
              ),
              child: const Text(
                'Mulai',
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
    );
  }
}
