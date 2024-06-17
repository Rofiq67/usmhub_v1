import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController textController;
  final VoidCallback onSend;
  final VoidCallback onFile;
  const MyTextField(
      {super.key,
      required this.textController,
      required this.onSend,
      required this.onFile});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 200,
      ),
      width: double.maxFinite,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 10, top: 8),
              child: TextField(
                controller: textController,
                minLines: 1,
                maxLines: null,
                // focusNode: focusNode,
                decoration: InputDecoration(
                  fillColor: const Color(0xfff5f5f5),
                  filled: true,
                  border: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Color(0xffE6E6E6)),
                      borderRadius: BorderRadius.all(Radius.circular(29))),
                  hintText: 'Ketik pesan...',
                  hintStyle: GoogleFonts.poppins(
                    color: const Color(0xFF757F90),
                    fontSize: 16,
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
              onPressed: onFile,
              icon: const Icon(
                Iconsax.document,
                color: Color(0xfff5f5f5),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
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
              onPressed: onSend,
              icon: const Icon(
                Iconsax.direct_right5,
                color: Color(0xfff5f5f5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
