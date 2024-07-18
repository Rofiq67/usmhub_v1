import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:usmhub_v1/controllers/getfile_controller.dart';

class ViewPdf extends StatelessWidget {
  final String pdfUrl;
  final GetfileController getFileController = Get.find();

  ViewPdf({super.key, required this.pdfUrl});

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
      ),
      body: FutureBuilder<Uint8List?>(
        future: getFileController
            .getDoc(pdfUrl), // Use getFileController to call getDoc
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data != null) {
            // Display the PDF using SfPdfViewer.memory
            return SfPdfViewer.memory(
              snapshot.data!,
              canShowScrollHead: true,
            );
          } else {
            // If there is an error or null data, show an error message
            return const Center(child: const Text('Failed to load PDF'));
          }
        },
      ),
    );
  }
}
