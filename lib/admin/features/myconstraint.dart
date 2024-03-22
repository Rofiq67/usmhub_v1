import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

var myDefaultBackground = Colors.grey[300];

var myAppbar = AppBar(
  elevation: 1,
);

var myDrawer = const Drawer(
  elevation: 1,
  child: Column(
    children: [
      DrawerHeader(
        child: Icon(Iconsax.heart),
      ),
      ListTile(
        leading: Icon(Iconsax.home_2),
        title: Text('Dashboard'),
      ),
      ListTile(
        leading: Icon(Iconsax.microphone),
        title: Text('Data Pengaduan'),
      ),
      ListTile(
        leading: Icon(Iconsax.lamp_on),
        title: Text('Data Aspirasi'),
      ),
      ListTile(
        leading: Icon(Iconsax.personalcard),
        title: Text('Data Users'),
      ),
      ListTile(
        leading: Icon(Iconsax.setting_2),
        title: Text('Settings'),
      ),
    ],
  ),
);
