// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String labelTxt;
  final String judulTxt;
  final String dateTxt;
  final String imgInfo;
  final Future<Uint8List?> Function(String) getImage;
  final VoidCallback onPressed;

  const InfoWidget({
    required this.labelTxt,
    required this.judulTxt,
    required this.dateTxt,
    required this.imgInfo,
    required this.getImage,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: SizedBox(
          width: double.maxFinite,
          height: 86,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    labelTxt,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF757F90),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.24,
                    ),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: 250,
                    height: 38,
                    child: Text(
                      judulTxt,
                      softWrap: true,
                      maxLines: 3,
                      style: const TextStyle(
                        color: Color(0xFF1C1C1C),
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.1,
                        letterSpacing: 0.32,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    dateTxt,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF757F90),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.24,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 84,
                height: 84,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FutureBuilder<Uint8List?>(
                    future: getImage(imgInfo),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
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
            ],
          ),
        ),
      ),
    );
  }
}
