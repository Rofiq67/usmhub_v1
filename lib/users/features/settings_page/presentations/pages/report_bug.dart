import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class ReportBug extends StatefulWidget {
  const ReportBug({super.key});

  @override
  State<ReportBug> createState() => _ReportBugState();
}

class _ReportBugState extends State<ReportBug> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(Iconsax.arrow_left),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffF5F5F5),
        scrolledUnderElevation: 0,
        title: const Text(
          'Laporkan Bug',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF1C1C1C),
            fontSize: 16,
            fontFamily: 'Poppins',
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
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      style: const TextStyle(
                        color: Color(0xff3E4095),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                      decoration: const InputDecoration(
                        // isDense: true,
                        prefixIconColor: Color(0xff3E4095),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 20, right: 10),
                          child: Icon(
                            Iconsax.direct_right,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xff3E4095)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(29))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xff3E4095)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(29))),
                        hintText: 'Judul Bug',
                        hintStyle: TextStyle(
                          color: Color(0xFF757F90),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.32,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff3e4095), width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(29),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xff3E4095)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(29))),
                        filled: true,
                        fillColor: Color(0xfff5f5f5),
                        prefixIconColor: Color(0xff3E4095),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 20, right: 10),
                          child: Icon(
                            Iconsax.direct_right,
                          ),
                        ),
                        hintText: 'Laporkan Bug',
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
                      height: 64,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff3E4095),
                        fixedSize: const Size(353, 60),
                      ),
                      child: const Text(
                        'Kirim',
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
            ],
          ),
        ),
      ),
    );
  }
}
