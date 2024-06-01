import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/features/pengaduan_page/data/models/aduan_models.dart';
import 'package:usmhub_v1/features/pengaduan_page/presentations/pages/form_pengaduan4.dart';

class FormPengaduan3 extends StatefulWidget {
  final TextEditingController keteranganController;
  final double initialRating;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  const FormPengaduan3({
    super.key,
    required this.keteranganController,
    required this.initialRating,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  State<FormPengaduan3> createState() => _FormPengaduan3State();
}

class _FormPengaduan3State extends State<FormPengaduan3> {
  // TextEditingController _keteranganController = TextEditingController();
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xfff5f5f5),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Iconsax.arrow_left),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              SizedBox(
                width: 88,
                height: 88,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '03',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 64,
                        fontWeight: FontWeight.w600,
                        height: 0.01,
                        letterSpacing: 1.28,
                      ),
                    ),
                    const SizedBox(height: 29),
                    const Divider(
                      height: 20,
                      thickness: 4,
                      indent: 40,
                      endIndent: 10,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 352,
                child: Text(
                  'Laporkan keterangan aduan dengan lengkap dan rinci, hal ini dapat memudahkan pemahaman detail aduan.',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.32,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: widget.keteranganController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3e4095), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(29)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Color(0xff3E4095)),
                    borderRadius: BorderRadius.all(Radius.circular(29)),
                  ),
                  filled: true,
                  fillColor: const Color(0xfff5f5f5),
                  prefixIconColor: const Color(0xff3E4095),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: Icon(Iconsax.direct_right),
                  ),
                  hintText: 'Keterangan aduan',
                  hintStyle: GoogleFonts.poppins(
                    color: const Color(0xFF757F90),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.32,
                  ),
                ),
                maxLines: 7,
                minLines: 1,
                maxLength: 250,
              ),
              const SizedBox(height: 16),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Berikan rating menurut Anda',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                    ),
                    RatingBar.builder(
                      initialRating: _rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 30,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          _rating = rating;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 194),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: widget.onPrevious,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3E4095),
                      fixedSize: const Size(353, 60),
                    ),
                    child: Text(
                      'Kembalii',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFFF9F9F9),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (widget.keteranganController.text.isNotEmpty) {
                        widget.onNext();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Silakan lengkapi keterangan.'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3E4095),
                      fixedSize: const Size(353, 60),
                    ),
                    child: Text(
                      'Selanjutnya',
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
            ],
          ),
        ),
      ),
    );
  }
}
