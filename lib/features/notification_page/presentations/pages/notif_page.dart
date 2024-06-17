import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/notification_page/presentations/widgets/notif_container.dart';
// import 'package:iconsax/iconsax.dart';

class NotifPage extends StatefulWidget {
  const NotifPage({super.key});

  @override
  State<NotifPage> createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 64,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notifikasi',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF1C1C1C),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: 0.48,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Baca semua',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF757F90),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.24,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const NotifContainer(
            judulNotif: 'Aspirasi',
            statusNotif: 'Aspirasi berhasil diverifikasi',
            waktuNotif: '5 Maret 2024',
            iconNtf: Iconsax.lamp_on5,
            clrIcon: Color(0xffFFB800),
            bgColor: Color(0xFFFEFBB9),
          ),
          const NotifContainer(
            judulNotif: 'Pengaduan',
            statusNotif: 'Pengaduan telah selesai',
            waktuNotif: '1 Maret 2024',
            iconNtf: Iconsax.microphone,
            clrIcon: Color(0xff3E4095),
            bgColor: Color(0xFFBCBEF3),
          ),
          const NotifContainer(
            judulNotif: 'Pengaduan pelayanan',
            statusNotif: 'Anda menerima komentar pada aduan',
            waktuNotif: '1 Maret 2024',
            iconNtf: Iconsax.message,
            clrIcon: Color(0xff3E4095),
            bgColor: Color(0xFFBCBEF3),
          ),
        ],
      ),
    );
  }
}
