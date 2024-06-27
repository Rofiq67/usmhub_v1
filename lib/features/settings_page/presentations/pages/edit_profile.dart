// ignore_for_file: invalid_use_of_protected_member, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:usmhub_v1/features/settings_page/presentations/pages/profile_page.dart';
import 'package:usmhub_v1/features/settings_page/presentations/widgets/card_edit_tgl_lhr.dart';
import 'package:usmhub_v1/features/settings_page/presentations/widgets/edit_card_profile.dart';
import 'package:usmhub_v1/features/registration_page/domains/controllers/auth.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final AuthController authController = Get.find<AuthController>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _tglLahirController = TextEditingController();
  final TextEditingController _progdiController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  File? _profileImage;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  void _loadUserProfile() {
    var userProfile = authController.userProfile.value;
    _firstNameController.text = userProfile['first_name'] ?? '';
    _lastNameController.text = userProfile['last_name'] ?? '';
    _usernameController.text = userProfile['username'] ?? '';
    _emailController.text = userProfile['email'] ?? '';
    //
    _tglLahirController.text = DateFormat('dd MMMM yyyy', 'id').format(
      DateFormat('yyyy-MM-dd').parse(userProfile['tgl_lahir'] ?? ''),
    );
    //
    _progdiController.text = userProfile['progdi'] ?? '';
    _genderController.text = userProfile['gender'] ?? '';
  }

  Future<void> _updateProfile() async {
    try {
      await authController.updateProfile(
        first_name: _firstNameController.text,
        last_name: _lastNameController.text,
        username: _usernameController.text,
        email: _emailController.text,
        img_profile: _profileImage,
        tgl_lahir:
            DateFormat('dd MMMM yyyy', 'id').parse(_tglLahirController.text),
        progdi: _progdiController.text,
        gender: _genderController.text,
      );

      // Refresh data setelah pembaruan berhasil
      _loadUserProfile();

      // Navigasi ke halaman profil setelah berhasil update
      Get.off(() => ProfilePage());

      // Cetak pesan di console jika img_profile terunggah
      if (_profileImage != null) {
        print('Image profile uploaded successfully.');
      }

      Get.snackbar(
        'Success',
        'Profile updated successfully',
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error',
        'An error occurred while updating profile. Please try again.',
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      );
    }
  }

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

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
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        title: Text(
          'Edit Profile',
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
              'Save',
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
      body: Obx(() {
        var userProfile = authController.userProfile.value;
        return userProfile.isNotEmpty
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
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: const [
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
                                child: _profileImage != null
                                    ? Image.file(
                                        _profileImage!,
                                        fit: BoxFit.cover,
                                      )
                                    : (userProfile['img_profile'] != null &&
                                            userProfile['img_profile']
                                                .isNotEmpty
                                        ? Image.asset(
                                            'assets/images/pp_mhs.png',
                                            fit: BoxFit.cover,
                                          )
                                        : Container(
                                            width: 36,
                                            height: 36,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: const Icon(
                                              Iconsax.user,
                                              size: 40,
                                              color: Color(0xFF757F90),
                                            ),
                                          )),
                              ),
                            ),
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
                                  icon: const Icon(
                                    Iconsax.gallery_edit,
                                    size: 20,
                                    color: Colors.white,
                                  ),
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
                              label: 'Nama depan',
                              iconData: Iconsax.user,
                              controller: _firstNameController,
                              readOnly: true, //boleh di edit
                            ),
                            EditCardProfile(
                              label: 'Nama Belakang',
                              iconData: Iconsax.user,
                              controller: _lastNameController,
                              readOnly: true,
                            ),
                            EditCardProfile(
                              label: 'Email',
                              iconData: Iconsax.direct,
                              controller: _emailController,
                              readOnly: true,
                            ),
                            EditCardProfile(
                              label: 'NIM (Read-only)',
                              iconData: Iconsax.user_tag,
                              controller: _usernameController,
                            ),
                            CardEditTglLhr(
                              label: 'Tanggal lahir',
                              iconData: Iconsax.calendar,
                              controller: _tglLahirController,
                            ),
                            EditCardProfile(
                              label: 'Program studi (Read-only)',
                              iconData: Iconsax.teacher,
                              controller: _progdiController,
                            ),
                            EditCardProfile(
                              label: 'Jenis kelamin',
                              iconData: Iconsax.man,
                              controller: _genderController,
                            ),
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
              );
      }),
    );
  }
}
