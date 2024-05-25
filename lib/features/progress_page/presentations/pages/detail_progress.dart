import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/progress_page/presentations/widgets/card_status.dart';
import 'package:usmhub_v1/features/progress_page/presentations/widgets/modal_progress.dart';

class DetailProgress extends StatefulWidget {
  const DetailProgress({super.key});

  @override
  State<DetailProgress> createState() => _DetailProgressState();
}

class _DetailProgressState extends State<DetailProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF5F5F5),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.arrow_left),
          ),
        ),
      ),
      floatingActionButton: const ModalProgress(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            Container(
              width: 353,
              height: 146,
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pengaduan',
                        style: TextStyle(
                          color: Color(0xFF757F90),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.28,
                        ),
                      ),
                      const SizedBox(
                        width: 194,
                        child: Text(
                          'Lahan Parkir yang Sempit',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: 0.32,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '1 Maret 2024',
                            style: TextStyle(
                              color: Color(0xFF757F90),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 0.28,
                            ),
                          ),
                          const SizedBox(
                            width: 55,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 9,
                                height: 9,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFF20EA00),
                                  shape: OvalBorder(),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                'Aktif',
                                style: TextStyle(
                                  color: Color(0xFF1C1C1C),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: 0.28,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                      width: 114,
                      height: 114,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/parkir_usm.png',
                          fit: BoxFit.cover,
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              'Status terbaru',
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
            const CardStatus(
              judulSts: 'Pengaduan ditindaklanjuti',
              isiSts:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
              dateSts: '5 Min lalu',
            ),
            const CardStatus(
              judulSts: 'Pengaduan telah diverifikasi',
              isiSts:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. silahkan buka komentar',
              dateSts: '5 Min lalu',
            ),
          ],
        ),
      ),
    );
  }
}
