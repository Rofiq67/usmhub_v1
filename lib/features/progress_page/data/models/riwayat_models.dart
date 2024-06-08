import 'package:flutter/material.dart';

class Riwayat {
  final String jenis;
  final IconData icon;
  final Color colorIcon;
  final Color bgColorIcon;
  final String judul;
  final String status;
  final DateTime tanggal;

  Riwayat({
    required this.jenis,
    required this.icon,
    required this.colorIcon,
    required this.bgColorIcon,
    required this.judul,
    required this.status,
    required this.tanggal,
  });
}
