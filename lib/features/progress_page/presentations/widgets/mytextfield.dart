import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: double.maxFinite,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              width: 309,
              height: 74,
              child: const TextField(
                minLines: 1,
                maxLines: null,
                // focusNode: focusNode,
                decoration: InputDecoration(
                  fillColor: Color(0xfff5f5f5),
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Color(0xffE6E6E6)),
                      borderRadius: BorderRadius.all(Radius.circular(29))),
                  hintText: 'Ketik pesan...',
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
            ),
          ),
          Container(
              width: 51,
              height: 51,
              decoration: ShapeDecoration(
                color: const Color(0xFF3E4095),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.direct_right5,
                    color: Color(0xfff5f5f5),
                  )))
        ],
      ),
    );
  }
}
