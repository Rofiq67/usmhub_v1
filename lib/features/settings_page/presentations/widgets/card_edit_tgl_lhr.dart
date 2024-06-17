import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class CardEditTglLhr extends StatefulWidget {
  final String label;
  final IconData iconData;
  final TextEditingController controller;

  const CardEditTglLhr({
    Key? key,
    required this.label,
    required this.iconData,
    required this.controller,
  }) : super(key: key);

  @override
  _CardEditTglLhrState createState() => _CardEditTglLhrState();
}

class _CardEditTglLhrState extends State<CardEditTglLhr> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    // Inisialisasi _selectedDate dengan nilai dari widget.controller
    _selectedDate = widget.controller.text.isNotEmpty
        ? DateFormat('dd MMMM yyyy', 'id_ID').parse(widget.controller.text)
        : DateTime.now(); // Atau gunakan DateTime.now() jika kosong
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate, // Gunakan _selectedDate sebagai tanggal awal
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        // Tetapkan nilai _selectedDate ke widget.controller.text
        widget.controller.text =
            DateFormat('dd MMMM yyyy', 'id_ID').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: widget.controller,
        readOnly: true,
        onTap: () => _selectDate(context),
        decoration: InputDecoration(
          labelText: widget.label,
          prefixIcon: Icon(widget.iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        style: GoogleFonts.poppins(
          fontSize: 16,
        ),
      ),
    );
  }
}
