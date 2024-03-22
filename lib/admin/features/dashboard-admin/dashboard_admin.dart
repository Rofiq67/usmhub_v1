import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
              extended: isExpanded,
              backgroundColor: Colors.white,
              selectedIconTheme: const IconThemeData(color: Color(0xff3E4095)),
              unselectedIconTheme:
                  const IconThemeData(color: Color(0xff757F90)),
              unselectedLabelTextStyle: const TextStyle(color: Colors.white),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Iconsax.home_2),
                  label: Text('home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Iconsax.microphone),
                  label: Text('Pengaduan'),
                ),
                NavigationRailDestination(
                  icon: Icon(Iconsax.lamp_on),
                  label: Text('Aspirasi'),
                ),
                NavigationRailDestination(
                  icon: Icon(Iconsax.personalcard),
                  label: Text('data-users'),
                ),
                NavigationRailDestination(
                  icon: Icon(Iconsax.setting_2),
                  label: Text('Setting'),
                ),
              ],
              selectedIndex: 0)
        ],
      ),
    );
  }
}
