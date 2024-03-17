import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/users/features/progress_page/presentations/widgets/card_progress.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 64,
            ),
            Text(
              'Progress',
              style: TextStyle(
                color: Color(0xFF1C1C1C),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 0.48,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'Sedang berjalan',
              style: TextStyle(
                color: Color(0xFF1C1C1C),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 0.48,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            CardProgress(
              iconCard: Iconsax.microphone,
              colorIconCard: Color(0xff3E4095),
              bgIconCard: Color(0xFFBCBEF3),
              jdlCard: 'Pengaduan lahan parkir yang sempit',
              stsCard: 'Aspirasi telah selesai',
              dateCard: '28 Februari 2024',
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'Selesai',
              style: TextStyle(
                color: Color(0xFF1C1C1C),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 0.48,
              ),
            ),
            SizedBox(height: 16),
            CardProgress(
              iconCard: Iconsax.lamp_on5,
              colorIconCard: Color(0xffff8800),
              bgIconCard: Color(0xffFEFCB9),
              jdlCard: 'Aspirasi perpustakaan',
              stsCard: 'Aspirasi telah selesai',
              dateCard: '28 Februari 2024',
            ),
            SizedBox(
              height: 16,
            ),
            CardProgress(
              iconCard: Iconsax.microphone,
              colorIconCard: Color(0xff3E4095),
              bgIconCard: Color(0xFFBCBEF3),
              jdlCard: 'Pengaduan lahan parkir yang sempit',
              stsCard: 'Aspirasi telah selesai',
              dateCard: '28 Februari 2024',
            ),
          ],
        ),
      ),
    );
  }
}
