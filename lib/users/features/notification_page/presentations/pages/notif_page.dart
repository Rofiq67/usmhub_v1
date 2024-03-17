import 'package:flutter/material.dart';
import 'package:usmhub_v1/users/features/notification_page/presentations/widgets/notif_container.dart';
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
                const Text(
                  'Notifikasi',
                  style: TextStyle(
                    color: Color(0xFF1C1C1C),
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: 0.48,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Baca semua',
                    style: TextStyle(
                      color: Color(0xFF757F90),
                      fontSize: 12,
                      fontFamily: 'Poppins',
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
              judulNotif: 'Lahan Sempit',
              statusNotif: 'Pengaduan Berhasil Dikirim',
              waktuNotif: '5 Maret 2024'),
          const NotifContainer(
              judulNotif: 'Tidak ada tempat tugas',
              statusNotif: 'Verifikasi Pengaduan',
              waktuNotif: '1 Maret 2024')
        ],
      ),
    );
  }
}
