import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BubbleChatAdmin extends StatelessWidget {
  const BubbleChatAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 53,
            height: 53,
            decoration: ShapeDecoration(
              color: const Color(0xFFD1D2FE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: const Icon(Iconsax.user),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 284,
                height: 83,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFF3E4095),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia.',
                  style: TextStyle(
                    color: Color(0xFFF5F5F5),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.28,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                '5 min lalu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF757F90),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.24,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
