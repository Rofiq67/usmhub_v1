import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/settings_page/presentations/widgets/input_widget.dart';

class ReportBug extends StatefulWidget {
  const ReportBug({super.key});

  @override
  State<ReportBug> createState() => _ReportBugState();
}

class _ReportBugState extends State<ReportBug> {
  final TextEditingController _judulbugController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Iconsax.arrow_left)),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffF5F5F5),
        scrolledUnderElevation: 0,
        title: Text(
          'Laporkan Bug',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: const Color(0xFF1C1C1C),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 0.32,
          ),
        ),
      ),
      body: SingleChildScrollView(
        // reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: 352,
                child: Text(
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia.',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.32,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Form(
                child: Column(
                  children: [
                    InputWidget(
                        hintTxt: 'Judul Bug',
                        controller: _judulbugController,
                        obscureTxt: false,
                        prefixIcon: Iconsax.warning_2),
                    const SizedBox(
                      height: 16,
                    ),
                    InputWidget(
                        hintTxt: 'Laporkan Bug',
                        controller: _judulbugController,
                        obscureTxt: false,
                        prefixIcon: Iconsax.direct_right),
                    const SizedBox(
                      height: 16,
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
                      child: Text(
                        'Kirim',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFF9F9F9),
                          fontSize: 16,
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
      ),
    );
  }
}
