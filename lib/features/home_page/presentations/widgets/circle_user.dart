// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CircleUser extends StatelessWidget {
  final String imgProfile;
  final Future<Uint8List?> Function(String) getImage;
  const CircleUser(
      {super.key, required this.imgProfile, required this.getImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 10,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: FutureBuilder<Uint8List?>(
          future: getImage(imgProfile),
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
                  'assets/images/pp_mhs.png', // Fallback image
                  fit: BoxFit.cover,
                );
              }
            } else {
              return const Icon(
                Iconsax.user,
                size: 20,
                color: Color(0xFF757F90),
              );
            }
          },
        ),
      ),
    );
  }
}
