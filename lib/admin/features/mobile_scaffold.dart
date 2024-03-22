import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/admin/features/banner_admin.dart';
import 'package:usmhub_v1/admin/features/infodashboard.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/admin/features/myconstraint.dart';
// import 'package:usmhub_v1/admin/features/tile_features.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackground,
      appBar: myAppbar,
      drawer: myDrawer,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: BannerAdmin(),
            ),

            //tile features
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Column(
                children: [
                  SizedBox(height: 16), // Add spacing between widgets
                  InfoDashboard(
                    title: "Total Pengaduan",
                    totalValue: '133',
                    valueToday: '+3 Aduan',
                    iconData: Iconsax.microphone,
                    iconColor: Color(0xff3E4095),
                    backgroundColor: Color(0xffEEEFF8),
                  ),
                  SizedBox(height: 16), // Add spacing between widgets
                  InfoDashboard(
                    title: "Total Pengaduan",
                    totalValue: '133',
                    valueToday: '+3 Aduan',
                    iconData: Iconsax.lamp_on,
                    iconColor: Color(0xffFFB800),
                    backgroundColor: Color(0xffFDFCE2),
                  ),
                  SizedBox(height: 16), // Add spacing between widgets
                  InfoDashboard(
                    title: "Total Pengaduan",
                    totalValue: '133',
                    valueToday: '+3 Aduan',
                    iconData: Iconsax.user,
                    iconColor: Color(0xff1C1C1C),
                    backgroundColor: Color(0xff757F90),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
