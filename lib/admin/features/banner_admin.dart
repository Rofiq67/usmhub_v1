import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BannerAdmin extends StatelessWidget {
  const BannerAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      width: double.infinity,
      height: 210,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Color(0xff20214E),
            Color(0xff3E4095),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: SvgPicture.asset('assets/images/usm_new.svg'),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: SvgPicture.asset('assets/images/sent_pengaduan.svg'),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: SvgPicture.asset('assets/images/usmhub.svg'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const SizedBox(
            width: 740,
            child: Text(
              'Suara Mahasiswa: Menyuarakan Aspirasi demi Kemajuan Universitas Semarang Bersama Kita Semua',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 0.48,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
