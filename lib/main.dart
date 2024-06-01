import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/chat_page/presentations/pages/chat_page.dart';
import 'package:usmhub_v1/features/home_page/presentations/pages/homepage.dart';
import 'package:usmhub_v1/features/notification_page/presentations/pages/notif_page.dart';
import 'package:usmhub_v1/features/pengaduan_page/presentations/pages/form_pengaduan4.dart';
import 'package:usmhub_v1/features/pengaduan_page/presentations/pages/pengaduan.dart';
import 'package:usmhub_v1/features/progress_page/presentations/pages/progress_page.dart';
import 'package:usmhub_v1/features/registration_page/presentations/pages/login_page.dart';
import 'package:usmhub_v1/features/settings_page/presentations/pages/settings_page.dart';
// import 'package:usmhub_v1/admin/features/dashboard-admin/dashboard_admin.dart';
// import 'package:usmhub_v1/admin/features/desktop_scaffold.dart';
// import 'package:usmhub_v1/admin/features/mobile_scaffold.dart';
// import 'package:usmhub_v1/admin/features/responsive_layout.dart';
// import 'package:usmhub_v1/admin/features/tablet_scaffold.dart';
// import 'package:usmhub_v1/users/features/home_page/presentations/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF5F5F5),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    ChatPage(),
    NotifPage(),
    ProgressPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 75,
        color: Colors.white,
        child: BottomNavigationBar(
          elevation: 1,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.message),
              label: 'Pesan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.activity),
              label: 'Progress',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.notification),
              label: 'Notifikasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.setting),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xff3E4095),
          unselectedItemColor: const Color(0xff757F90),
          onTap: _onItemTapped,
          selectedLabelStyle: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 0.24,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: 0.24,
          ),
        ),
      ),
    );
  }
}
