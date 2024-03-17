import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:iconsax/iconsax.dart';

class CardProgress extends StatelessWidget {
  final IconData iconCard;
  final Color colorIconCard;
  final Color bgIconCard;
  final String jdlCard;
  final String stsCard;
  final String dateCard;
  const CardProgress(
      {required this.iconCard,
      required this.colorIconCard,
      required this.bgIconCard,
      required this.jdlCard,
      required this.stsCard,
      required this.dateCard,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      width: 353,
      height: 88,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 39,
                height: 39,
                decoration: ShapeDecoration(
                  // color: const Color(0xFFBCBEF3),
                  color: bgIconCard,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Center(
                  child: Icon(
                    // Iconsax.volume_low_15,
                    iconCard,
                    // color: const Color(0xff3E4095),
                    color: colorIconCard,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      width: 184,
                      padding: const EdgeInsets.only(right: 1),
                      child: Text(
                        jdlCard,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
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
                  ),
                  Text(
                    stsCard,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: 0.32,
                    ),
                  ),
                  Text(
                    dateCard,
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
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'detail',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.24,
              ),
            ),
          )
        ],
      ),
    );
  }
}
