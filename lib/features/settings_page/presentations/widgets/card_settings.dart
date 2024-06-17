import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CardSettings extends StatefulWidget {
  final IconData? iconData;
  final String? iconSVg;
  final String txtCard;
  final Color? colorIcon;
  final VoidCallback onPress;

  const CardSettings({
    super.key,
    this.iconSVg,
    this.iconData,
    required this.txtCard,
    // ignore: use_full_hex_values_for_flutter_colors
    this.colorIcon = const Color(0xdff3e4095),
    required this.onPress,
  });

  @override
  State<CardSettings> createState() => _CardSettingsState();
}

class _CardSettingsState extends State<CardSettings> {
  @override
  Widget build(BuildContext context) {
    bool showSvgIcon = widget.iconSVg != null;

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: ElevatedButton(
        onPressed: widget.onPress,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(332, 51),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (showSvgIcon)
                  SvgPicture.asset(
                    widget.iconSVg!,
                    width: 24,
                    height: 24,
                  )
                else if (widget.iconData != null)
                  Icon(
                    widget.iconData,
                    size: 25,
                    color: widget.colorIcon,
                  ),
                const SizedBox(width: 16),
                Text(
                  widget.txtCard,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF1C1C1C),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.32,
                  ),
                ),
              ],
            ),
            const Icon(
              Iconsax.arrow_right_3,
            ),
          ],
        ),
      ),
    );
  }
}
