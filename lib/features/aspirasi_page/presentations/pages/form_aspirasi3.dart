import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class FormAspirasi3 extends StatefulWidget {
  final TextEditingController keteranganController;
  final ValueChanged<double> onRatingChanged;

  const FormAspirasi3({
    Key? key,
    required this.keteranganController,
    required this.onRatingChanged,
  }) : super(key: key);

  @override
  State<FormAspirasi3> createState() => _FormAspirasi3State();
}

class _FormAspirasi3State extends State<FormAspirasi3> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            const SizedBox(
              width: 88,
              height: 88,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '03',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 64,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.01,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 29),
                  Divider(
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
            const SizedBox(
              height: 16,
            ),
            Text(
              'Rating',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 0,
                letterSpacing: 0.32,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Berilah penilaian tentang yang anda adukan',
              style: GoogleFonts.poppins(
                color: const Color(0xFF757F90),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.28,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: RatingBar.builder(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Iconsax.star1,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                  widget.onRatingChanged(rating);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
