import 'package:flutter/material.dart';

class PageComment extends StatefulWidget {
  const PageComment({super.key});

  @override
  State<PageComment> createState() => _PageCommentState();
}

class _PageCommentState extends State<PageComment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('komen'),
      ),
      body: Container(),
    );
  }
}
