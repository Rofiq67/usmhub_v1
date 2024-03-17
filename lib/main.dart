import 'package:flutter/material.dart';
// import 'package:usmhub_v1/features/aspirasi_page/presentations/pages/aspirasi.dart';
// import 'package:usmhub_v1/features/aspirasi_page/presentations/pages/form_aspirasi1.dart';
// import 'package:usmhub_v1/features/aspirasi_page/presentations/pages/form_aspirasi2.dart';
// import 'package:usmhub_v1/features/aspirasi_page/presentations/pages/form_aspirasi3.dart';
// import 'package:usmhub_v1/features/aspirasi_page/presentations/pages/sent_aspirasi.dart';
// import 'package:usmhub_v1/features/registration_page/presentations/pages/login_page.dart';
import 'package:usmhub_v1/features/registration_page/presentations/pages/signup_page.dart';
// import 'package:usmhub_v1/features/pengaduan_page/presentations/pages/form_pengaduan4.dart';
// import 'package:usmhub_v1/features/pengaduan_page/presentations/pages/form_pengaduan5.dart';
// import 'package:usmhub_v1/features/pengaduan_page/presentations/pages/sent_pengaduan.dart';
// import 'package:usmhub_v1/features/pengaduan_page/presentations/pages/form_pengaduan4.dart';
// import 'package:usmhub_v1/features/pengaduan_page/presentations/pages/mydropdown.dart';

// import 'features/home_page/presentations/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF5F5F5),
      ),
      debugShowCheckedModeBanner: false,
      home: const SignupPage(),
    );
  }
}
