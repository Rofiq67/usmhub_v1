import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Aspirasi extends StatefulWidget {
  const Aspirasi({super.key});

  @override
  State<Aspirasi> createState() => _AspirasiState();
}

class _AspirasiState extends State<Aspirasi> {
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
            const Text(
              'Petunjuk Aspirasi',
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
              height: 16,
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
            SizedBox(
              width: 352,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2, // jumlah item dalam list
                itemBuilder: (BuildContext context, int index) {
                  int itemNumber = index + 1; // nomor item dimulai dari 1
                  String itemText = '';
                  switch (index) {
                    case 0:
                      itemText =
                          'Tulis aspirasi, harapan, cita-cita, atau keinginan untuk mencapai sesuatu yang lebih baik.';
                      break;
                    case 1:
                      itemText =
                          'Verifikasi, dalam 3 hari laporan anda akan diverifikasi dan diteruskan kepada yang berwenang.';
                      break;
                    default:
                      itemText = '';
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$itemNumber. ',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: 0.32,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            itemText,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 0.32,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 64,
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
