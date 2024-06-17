// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:usmhub_v1/features/progress_page/data/models/komentar_model.dart';
import 'package:usmhub_v1/features/progress_page/domains/controllers/komentar_controller.dart';
import 'package:usmhub_v1/features/progress_page/presentations/widgets/bubble_chat_admin.dart';
import 'package:usmhub_v1/features/progress_page/presentations/widgets/bubble_chat_user.dart';
import 'package:usmhub_v1/features/progress_page/presentations/widgets/bubble_file_admin.dart';
import 'package:usmhub_v1/features/progress_page/presentations/widgets/bubble_file_user.dart';
import 'package:usmhub_v1/features/progress_page/presentations/widgets/bubble_image_user.dart';
import 'package:usmhub_v1/features/progress_page/presentations/widgets/buble_image_admin.dart';
import 'package:usmhub_v1/features/progress_page/presentations/widgets/mytextfield.dart';
import 'dart:io';

class KomentarPage extends StatefulWidget {
  final int aduanId;
  const KomentarPage({super.key, required this.aduanId});

  @override
  _KomentarPageState createState() => _KomentarPageState();
}

class _KomentarPageState extends State<KomentarPage> {
  late Future<List<Komentar>> _komentarListFuture;
  final KomentarController _komentarController = Get.find();
  final TextEditingController _textController = TextEditingController();
  PlatformFile? _selectedFile;
  bool _isFilePickerActive = false;

  @override
  void initState() {
    super.initState();
    _komentarListFuture = _komentarController.getKomentarList(widget.aduanId);
  }

  Future<void> _refreshKomentarList() async {
    setState(() {
      _komentarListFuture = _komentarController.getKomentarList(widget.aduanId);
    });
  }

  Future<void> _sendKomentar() async {
    if (_textController.text.trim().isNotEmpty || _selectedFile != null) {
      XFile? xFile;
      if (_selectedFile != null) {
        xFile = XFile(_selectedFile!.path!); // Convert PlatformFile to XFile
      }
      await _komentarController.kirimKomentar(
        aduanId: widget.aduanId,
        text: _textController.text.trim(),
        file: xFile,
      );
      _textController.clear();
      setState(() {
        _selectedFile = null;
      });
      _refreshKomentarList();
    } else {
      Get.snackbar('Error', 'Silahkan masukan text atau file',
          snackPosition: SnackPosition.TOP);
    }
  }

  void _pickFile() async {
    if (_isFilePickerActive) return;
    setState(() {
      _isFilePickerActive = true;
    });

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx'],
      );
      if (result != null && result.files.isNotEmpty) {
        setState(() {
          _selectedFile = result.files.first;
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error picking file: $e');
    } finally {
      setState(() {
        _isFilePickerActive = false;
      });
    }
  }

  void _removeSelectedFile() {
    setState(() {
      _selectedFile = null;
    });
  }

  void _showEditDeleteMenu(Komentar komentar) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Pilihan',
          style: GoogleFonts.poppins(
            color: const Color(0xFF1C1C1C),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 0.32,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Iconsax.magicpen),
              title: Text(
                'Edit',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF1C1C1C),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.32,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Tutup dialog
                _editKomentar(komentar);
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.trash),
              title: Text(
                'Hapus',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF1C1C1C),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.32,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Tutup dialog
                _deleteKomentar(komentar);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _editKomentar(Komentar komentar) {
    TextEditingController _editController =
        TextEditingController(text: komentar.text);

    // Initialize file variables
    XFile? _selectedFile;
    bool _isFilePickerActive = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Text(
              'Edit Komentar',
              style: GoogleFonts.poppins(
                color: const Color(0xFF1C1C1C),
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 0,
                letterSpacing: 0.32,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: _editController,
                  onChanged: (value) {
                    // Update state or controller if needed
                  },
                  decoration: InputDecoration(
                    labelText: 'Text',
                    labelStyle: GoogleFonts.poppins(
                      color: const Color(0xFF757F90),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.32,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (komentar.file != null) Text('File: ${komentar.file}'),
                ElevatedButton(
                  onPressed: () async {
                    if (_isFilePickerActive) return;
                    setState(() {
                      _isFilePickerActive = true;
                    });

                    try {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: [
                          'jpg',
                          'jpeg',
                          'png',
                          'pdf',
                          'doc',
                          'docx'
                        ],
                      );
                      if (result != null && result.files.isNotEmpty) {
                        setState(() {
                          // Convert PlatformFile to XFile
                          _selectedFile = XFile(result.files.first.path!);
                        });
                      }
                    } catch (e) {
                      // ignore: avoid_print
                      print('Error picking file: $e');
                    } finally {
                      setState(() {
                        _isFilePickerActive = false;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3E4095)),
                  child: Text(
                    'Pilih File',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: 0.32,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                },
                child: Text(
                  'Batal',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF1C1C1C),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 0.32,
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  try {
                    await _komentarController.updateKomentar(
                      komentarId: komentar.id,
                      text: _editController.text.trim(),
                      file: _selectedFile,
                    );
                    _editController.clear();
                    setState(() {
                      _selectedFile = null;
                    });
                    Navigator.pop(
                        // ignore: use_build_context_synchronously
                        context); // Close dialog after successful update
                    _refreshKomentarList(); // Refresh the list after successful update
                  } catch (e) {
                    // ignore: avoid_print
                    print('Error updating comment: $e');
                    Get.snackbar(
                      'Error',
                      'Terjadi kesalahan saat mengupdate komentar',
                      snackPosition: SnackPosition.TOP,
                    );
                  }
                },
                child: Text(
                  'Simpan',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF1C1C1C),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 0.32,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _deleteKomentar(Komentar komentar) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Hapus Komentar',
          style: GoogleFonts.poppins(
            color: const Color(0xFF1C1C1C),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 0.32,
          ),
        ),
        content: Text(
          'Apakah Anda yakin ingin menghapus komentar ini?',
          style: GoogleFonts.poppins(
            color: const Color(0xFF1C1C1C),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: 0.32,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Tutup dialog
            },
            child: Text(
              'Batal',
              style: GoogleFonts.poppins(
                color: const Color(0xFF1C1C1C),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 0,
                letterSpacing: 0.32,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              try {
                await KomentarController.deleteKomentar(komentar.id);
                _refreshKomentarList(); // Refresh daftar komentar setelah berhasil hapus
              } catch (e) {
                // ignore: avoid_print
                print('Error deleting comment: $e');
                Get.snackbar(
                    'Error', 'Terjadi kesalahan saat menghapus komentar',
                    snackPosition: SnackPosition.TOP);
              } finally {
                // ignore: use_build_context_synchronously
                Navigator.pop(context); // Tutup dialog setelah selesai
              }
            },
            child: Text(
              'Hapus',
              style: GoogleFonts.poppins(
                color: const Color(0xFFF54646),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 0,
                letterSpacing: 0.32,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Iconsax.arrow_left),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffF5F5F5),
        title: Text(
          'Komentar',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: const Color(0xFF1C1C1C),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 0.32,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshKomentarList,
        child: FutureBuilder<List<Komentar>>(
          future: _komentarListFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Tidak ada komentar.'));
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final komentar = snapshot.data![index];
                        Widget bubbleWidget;
                        if (komentar.file != null &&
                            komentar.file!.isNotEmpty) {
                          final extension =
                              komentar.file!.split('.').last.toLowerCase();
                          if (['jpg', 'jpeg', 'png'].contains(extension)) {
                            bubbleWidget = komentar.userId == 2
                                ? BubbleImageAdmin(
                                    filePath: 'assets/images/taman_usm.png',
                                    txtBubble: komentar.text ?? '',
                                    wktBubble: komentar.updatedAt,
                                  )
                                : BubbleImageUser(
                                    filePath: 'assets/images/taman_usm.png',
                                    txtBubble: komentar.text ?? '',
                                    wktBubble: komentar.updatedAt,
                                    onLongPress: () =>
                                        _showEditDeleteMenu(komentar),
                                  );
                          } else {
                            // Handle other file types like PDF, DOC, DOCX

                            bubbleWidget = komentar.userId == 2
                                ? BubbleFileAdmin(
                                    filePath: 'assets/doc/invoice.pdf',
                                    fileName: 'invoice.pdf',
                                    txtBubble: komentar.text ?? '',
                                    wktBubble: komentar.updatedAt,
                                  )
                                : BubbleFileUser(
                                    filePath: 'assets/doc/invoice.pdf',
                                    fileName: 'invoice.pdf',
                                    txtBubble: komentar.text ?? '',
                                    wktBubble: komentar.updatedAt,
                                    onLongPress: () =>
                                        _showEditDeleteMenu(komentar),
                                  ); // Placeholder for now
                          }
                        } else {
                          bubbleWidget = komentar.userId == 2
                              ? BubbleChatAdmin(
                                  txtBubble: komentar.text ?? '',
                                  wktBubble: komentar.updatedAt,
                                )
                              : BubbleChatUser(
                                  txtBubble: komentar.text ?? '',
                                  wktBubble: komentar.updatedAt,
                                  onLongPress: () =>
                                      _showEditDeleteMenu(komentar),
                                );
                        }
                        return Align(
                          alignment: komentar.userId == 2
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: bubbleWidget,
                        );
                      },
                    ),
                    const SizedBox(height: 150), // Adjust height as needed
                  ],
                ),
              );
            }
          },
        ),
      ),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_selectedFile != null)
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'File: ${_selectedFile!.name}',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Iconsax.close_circle),
                    onPressed: _removeSelectedFile,
                  ),
                ],
              ),
            ),
          MyTextField(
            textController: _textController,
            onSend: _sendKomentar,
            onFile: _pickFile,
          ),
        ],
      ),
    );
  }
}
