import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NotifContainer extends StatefulWidget {
  final String judulNotif;
  final String statusNotif;
  final String waktuNotif;
  const NotifContainer(
      {required this.judulNotif,
      required this.statusNotif,
      required this.waktuNotif,
      super.key});

  @override
  State<NotifContainer> createState() => _NotifContainerState();
}

bool isNotif = false;

class _NotifContainerState extends State<NotifContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isNotif) {
          setState(() {
            isNotif = true;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        width: double.maxFinite,
        height: 88,
        decoration: BoxDecoration(
          color: isNotif ? const Color(0xfff5f5f5) : Colors.white,
          border: const Border(
            bottom: BorderSide(
              width: 0.5,
              color: Color(0xFF757F90),
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: ShapeDecoration(
                color: const Color(0xFFBCBEF3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: const Center(
                child: Icon(
                  Iconsax.notification,
                  size: 28,
                  color: Color(0xFF3E4095),
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
                Text(
                  widget.judulNotif,
                  style: const TextStyle(
                    color: Color(0xFF757F90),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.24,
                  ),
                ),
                Text(
                  widget.statusNotif,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 0.32,
                  ),
                ),
                Text(
                  widget.waktuNotif,
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
            )
          ],
        ),
      ),
    );
  }
}
