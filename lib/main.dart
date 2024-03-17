import 'package:flutter/material.dart';
import 'package:usmhub_v1/users/features/home_page/presentations/pages/homepage.dart';

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
      home: const HomePage(),
    );
  }
}
