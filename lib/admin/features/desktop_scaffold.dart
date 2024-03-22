import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:usmhub_v1/admin/features/banner_admin.dart';
import 'package:usmhub_v1/admin/features/infodashboard.dart';
import 'package:usmhub_v1/admin/features/myconstraint.dart';
// import 'package:usmhub_v1/admin/features/tile_features.dart';

class DesktopScafoold extends StatefulWidget {
  const DesktopScafoold({super.key});

  @override
  State<DesktopScafoold> createState() => _DesktopScafooldState();
}

class _DesktopScafooldState extends State<DesktopScafoold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackground,
      appBar: myAppbar,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //tabbar
          myDrawer,
          //main content
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Expanded(
                    flex: 0,
                    child: BannerAdmin(),
                  ),

                  // //Main content

                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 200,
                          height: 150,
                          child: InfoDashboard(
                            title: "Total Pengaduan",
                            totalValue: '133',
                            valueToday: '+3',
                            iconData: Iconsax.microphone,
                            iconColor: Color(0xff3E4095),
                            backgroundColor: Color(0xffEEEFF8),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 200,
                          height: 150,
                          child: InfoDashboard(
                            title: "Total Aspirasi",
                            totalValue: '13',
                            valueToday: '+3',
                            iconData: Iconsax.lamp_on,
                            iconColor: Color(0xffFFB800),
                            backgroundColor: Color(0xffFDFCE2),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 200,
                          height: 150,
                          child: InfoDashboard(
                            title: "Total Users",
                            totalValue: '100',
                            valueToday: '0',
                            iconData: Iconsax.user,
                            iconColor: Color(0xff1C1C1C),
                            backgroundColor: Color(0xff757F90),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                  //
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
