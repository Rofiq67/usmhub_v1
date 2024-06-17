// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:usmhub_v1/features/settings_page/data/models/user_model.dart';
import 'package:usmhub_v1/features/settings_page/domains/controllers/settings_controller.dart';
import 'package:usmhub_v1/features/settings_page/presentations/pages/edit_profile.dart';
import 'package:usmhub_v1/features/settings_page/presentations/widgets/card_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final SettingsController _settingsController = Get.put(SettingsController());
  User? _user;

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    try {
      String token = _settingsController.token;
      if (token.isNotEmpty) {
        User userProfile = await _settingsController.getUserProfile(token);
        setState(() {
          _user = userProfile;
        });
      } else {
        // Handle case where token is not available
        print('Token is not available');
      }
    } catch (e) {
      // Handle error fetching user profile
      print('Failed to fetch user profile: $e');
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd MMMM yyyy', 'id_ID').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF5F5F5),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Iconsax.arrow_left),
          ),
        ),
        title: Text(
          'Profil',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: const Color(0xFF1C1C1C),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 0.32,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Get.to(() => const EditProfile())?.then((value) {
                _fetchUserProfile(); // Update profile after editing
              });
            },
            child: Text(
              'Ubah',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.28,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
          ),
        ],
      ),
      body: _user != null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  Center(
                    child: Container(
                      width: 108,
                      height: 108,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 10,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/pp_mhs.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    width: double.maxFinite,
                    height: 340,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Column(
                      children: [
                        CardProfile(
                          txtCard: '${_user!.firstName} ${_user!.lastName}',
                          iconData: Iconsax.user,
                        ),
                        CardProfile(
                          txtCard: _user!.email,
                          iconData: Iconsax.sms,
                        ),
                        CardProfile(
                          txtCard: _user!.username,
                          iconData: Iconsax.tag_user,
                        ),
                        CardProfile(
                          txtCard: _user!.tglLahir != null
                              ? _formatDate(_user!.tglLahir!)
                              : '',
                          iconData: Iconsax.calendar_1,
                        ),
                        CardProfile(
                          txtCard: _user!.progdi,
                          iconData: Iconsax.man,
                        ),
                        CardProfile(
                          txtCard: _user!.gender,
                          iconData: Iconsax.location,
                        ),
                        // Add other user properties here as needed
                      ],
                    ),
                  ),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
