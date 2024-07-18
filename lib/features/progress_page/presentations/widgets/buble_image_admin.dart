// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class BubbleImageAdmin extends StatelessWidget {
  final Future<Uint8List?> Function(String) imageKomentar;
  final String filePath;
  final String txtBubble;
  final DateTime wktBubble;
  final String? firstName;
  final String? lastName;
  final String userRole;

  const BubbleImageAdmin({
    Key? key,
    required this.filePath,
    required this.imageKomentar,
    required this.txtBubble,
    required this.wktBubble,
    this.firstName,
    this.lastName,
    required this.userRole,
  }) : super(key: key);

  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FutureBuilder<Uint8List?>(
                future: imageKomentar(filePath),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    print('Error fetching image data: ${snapshot.error}');
                    return Image.asset(
                      'assets/images/taman_usm.png', // Fallback image
                      fit: BoxFit.cover,
                    );
                  } else if (snapshot.hasData && snapshot.data != null) {
                    try {
                      return Image.memory(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      );
                    } catch (e) {
                      print('Error displaying image: $e');
                      return Image.asset(
                        'assets/images/taman_usm.png', // Fallback image
                        fit: BoxFit.cover,
                      );
                    }
                  } else {
                    return Image.asset(
                      'assets/images/taman_usm.png', // Fallback image
                      fit: BoxFit.cover,
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = _formatTime(wktBubble);

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (userRole == 'Superadmin' || userRole == 'Admin') ...[
            Text(
              '${firstName ?? ''} ${lastName ?? ''}',
              style: GoogleFonts.poppins(
                color: const Color(0xFF757F90),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),
          ],
          GestureDetector(
            onTap: () => _showImageDialog(context),
            child: Container(
              width: 250,
              height: 300,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFF757F90),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FutureBuilder<Uint8List?>(
                  future: imageKomentar(filePath),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      print('Error fetching image data: ${snapshot.error}');
                      return Image.asset(
                        'assets/images/taman_usm.png', // Fallback image
                        fit: BoxFit.cover,
                      );
                    } else if (snapshot.hasData && snapshot.data != null) {
                      try {
                        return Image.memory(
                          snapshot.data!,
                          fit: BoxFit.cover,
                        );
                      } catch (e) {
                        print('Error displaying image: $e');
                        return Image.asset(
                          'assets/images/taman_usm.png', // Fallback image
                          fit: BoxFit.cover,
                        );
                      }
                    } else {
                      return Image.asset(
                        'assets/images/taman_usm.png', // Fallback image
                        fit: BoxFit.cover,
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8,
              maxHeight: MediaQuery.of(context).size.height * 0.3,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFF757F90),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              txtBubble,
              style: GoogleFonts.poppins(
                color: const Color(0xFFF5F5F5),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.28,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            formattedTime,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: const Color(0xFF757F90),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.24,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    DateTime now = DateTime.now();
    DateTime timeToShow = time.toLocal();

    if (now.difference(timeToShow).inHours < 24) {
      return DateFormat.jm('id_ID').format(timeToShow);
    } else {
      initializeDateFormatting('id_ID');
      return DateFormat('EEEE, dd MMMM yyyy HH:mm', 'id_ID').format(timeToShow);
    }
  }
}
