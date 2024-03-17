import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CardStatus extends StatelessWidget {
  final String judulSts;
  final String isiSts;
  final String dateSts;
  const CardStatus(
      {required this.judulSts,
      required this.isiSts,
      required this.dateSts,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: 92,
      width: double.maxFinite,
      child: Row(
        children: [
          Container(
            width: 39,
            height: 39,
            decoration: ShapeDecoration(
              color: const Color(0xFFBCBEF3),
              // color: bgIconCard,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: const Icon(
              Iconsax.direct_right,
              // iconCard,
              color: Color(0xff3E4095),
              // color: colorIconCard,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // 'Pengaduan ditindaklanjuti',
                judulSts,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 0.28,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 224,
                child: Text(
                  isiSts,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Color(0xFF757F90),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.24,
                  ),
                ),
              ),
              // SizedBox(height: 16),
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            dateSts,
            style: const TextStyle(
              color: Color(0xFF757F90),
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.20,
            ),
          ),
        ],
      ),
    );
  }
}
