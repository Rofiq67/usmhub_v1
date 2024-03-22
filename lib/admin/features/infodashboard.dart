import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';

class InfoDashboard extends StatelessWidget {
  final String title;
  final String valueToday;
  final String totalValue;
  final IconData iconData;
  final Color iconColor;
  final Color backgroundColor;

  const InfoDashboard({
    super.key,
    required this.title,
    required this.valueToday,
    required this.totalValue,
    required this.iconData,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobileOrTablet = MediaQuery.of(context).size.width < 1100;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: isMobileOrTablet
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        totalValue,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                          letterSpacing: 0.64,
                        ),
                      ),
                      Text(
                        valueToday,
                        style: const TextStyle(
                          color: Color(0xFF63E712),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.64,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  iconData,
                  size: 32.0,
                  color: iconColor,
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  totalValue,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 0.64,
                  ),
                ),
                Text(
                  valueToday,
                  style: const TextStyle(
                    color: Color(0xFF63E712),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.64,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    iconData,
                    size: 32.0,
                    color: iconColor,
                  ),
                ),
              ],
            ),
    );
  }
}
