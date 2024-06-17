// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:usmhub_v1/features/settings_page/data/models/user_model.dart';
import 'package:usmhub_v1/features/settings_page/domains/controllers/settings_controller.dart';
import 'package:usmhub_v1/features/settings_page/presentations/pages/profile_page.dart';
import 'package:usmhub_v1/features/settings_page/presentations/widgets/card_edit_tgl_lhr.dart';
import 'package:usmhub_v1/features/settings_page/presentations/widgets/edit_card_profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final SettingsController _settingsController = Get.put(SettingsController());
  User? _user;
  File? _profileImage;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _tglLahirController = TextEditingController();
  final TextEditingController _progdiController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  // static const progdiOptions = [
  //   'Teknik Informatika',
  //   'Sistem Informasi',
  //   'Ilmu Komunikasi',
  //   'Pariwisata',
  // ];

  // static const genderOptions = [
  //   'Laki-laki',
  //   'Perempuan',
  // ];

  Future<void> _fetchUserProfile() async {
    try {
      String token = _settingsController.token;
      if (token.isNotEmpty) {
        User userProfile = await _settingsController.getUserProfile(token);
        setState(() {
          _user = userProfile;
          _firstNameController.text = _user!.firstName;
          _lastNameController.text = _user!.lastName;
          _usernameController.text = _user!.username;
          _emailController.text = _user!.email;
          _tglLahirController.text =
              _user!.tglLahir != null ? _formatDate(_user!.tglLahir!) : '';
          _progdiController.text = _user!.progdi;
          _genderController.text = _user!.gender;
        });
      } else {
        print('Token is not available');
      }
    } catch (e) {
      print('Failed to fetch user profile: $e');
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd MMMM yyyy', 'id_ID').format(date);
  }

  Future<void> _updateProfile() async {
    if (_user != null) {
      try {
        // Validate and parse the date input
        DateTime? parsedDate;
        if (_tglLahirController.text.isNotEmpty) {
          try {
            parsedDate = DateFormat('dd MMMM yyyy', 'id_ID')
                .parse(_tglLahirController.text);
          } catch (e) {
            print('Failed to parse date: $e');
          }
        }

        User updatedUser = User(
          id: _user!.id,
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          username: _usernameController.text,
          email: _emailController.text,
          imgProfile: _user!.imgProfile,
          tglLahir: parsedDate,
          progdi: _progdiController.text,
          gender: _genderController.text,
        );

        User user =
            await _settingsController.updateProfile(updatedUser, _profileImage);
        setState(() {
          _user = user;
        });

        if (_profileImage != null) {
          print('Photo profile successfully updated');
        }

        // After successful update, navigate back to ProfilePage
        Get.back();
        Get.to(() => const ProfilePage());

        Get.snackbar('Success', 'Profile updated successfully');
      } catch (e) {
        print('Failed to update user profile: $e');
        Get.snackbar('Error', 'Failed to update profile');
      }
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
          'Edit Profil',
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
            onPressed: _updateProfile,
            child: Text(
              'Simpan',
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 64,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Container(
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
                                child: _profileImage == null
                                    ? (_user!.imgProfile.isNotEmpty
                                        ? Image.asset(
                                            // Ganti dengan gambar lokal
                                            'assets/images/pp_mhs.png',
                                            fit: BoxFit.cover,
                                          )
                                        : const Icon(
                                            Iconsax.profile_circle,
                                            color: Color(0xFF757F90),
                                          ))
                                    : Image.file(
                                        _profileImage!,
                                        fit: BoxFit.cover,
                                      ),
                              )),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: const Icon(Iconsax.gallery_edit,
                                    size: 20, color: Colors.white),
                                onPressed: _pickImage,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      width: double.maxFinite,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Column(
                        children: [
                          EditCardProfile(
                            label: 'Nama Depan',
                            iconData: Iconsax.user,
                            controller: _firstNameController,
                          ),
                          EditCardProfile(
                            label: 'Nama Belakang',
                            iconData: Iconsax.user,
                            controller: _lastNameController,
                          ),
                          EditCardProfile(
                            label: 'Email',
                            iconData: Iconsax.sms,
                            controller: _emailController,
                          ),
                          EditCardProfile(
                            label: 'NIM (readonly)',
                            iconData: Iconsax.tag_user,
                            controller: _usernameController,
                            readOnly: false,
                          ),
                          CardEditTglLhr(
                            label: 'Tanggal lahir',
                            iconData: Iconsax.calendar,
                            controller: _tglLahirController,
                          ),
                          EditCardProfile(
                            label: 'Program Studi (readonly)',
                            iconData: Iconsax.tag_user,
                            controller: _progdiController,
                            readOnly: false,
                          ),
                          EditCardProfile(
                            label: 'Jenis Kelamin (readonly)',
                            iconData: Iconsax.tag_user,
                            controller: _genderController,
                            readOnly: false,
                          ),
                          // DropdownProfil(
                          //   label: 'Program Studi',
                          //   iconData: Iconsax.teacher,
                          //   value: _progdiController.text,
                          //   items: progdiOptions,
                          //   onChanged: (newValue) {
                          //     setState(() {
                          //       _progdiController.text = newValue!;
                          //     });
                          //   },
                          // ),
                          // DropdownProfil(
                          //   label: 'Jenis Kelamin',
                          //   iconData: Iconsax.man,
                          //   value: _genderController.text,
                          //   items: genderOptions,
                          //   onChanged: (newValue) {
                          //     setState(() {
                          //       _genderController.text = newValue!;
                          //     });
                          //   },
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
