import 'package:intl/intl.dart';

class Komentar {
  final int id;
  final int aduanId;
  final int userId;
  final String? text;
  final String? file;
  final DateTime createdAt;
  final DateTime updatedAt;

  Komentar({
    required this.id,
    required this.aduanId,
    required this.userId,
    this.text,
    this.file,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Komentar.fromJson(Map<String, dynamic> json) {
    return Komentar(
      id: json['id'],
      aduanId: json['aduan_id'],
      userId: json['user_id'],
      text: json['text'],
      file: json['file'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  String formattedUpdatedAt() {
    DateTime now = DateTime.now();
    DateTime updatedAtDate = updatedAt.toLocal();

    if (now.year == updatedAtDate.year &&
        now.month == updatedAtDate.month &&
        now.day == updatedAtDate.day) {
      // Jika komentar dibuat hari ini
      return DateFormat.jm().format(updatedAtDate); // Contoh: 12.36 AM
    } else {
      // Jika komentar dibuat hari lain
      return DateFormat('EEEE, dd MMMM yyyy')
          .format(updatedAtDate); // Contoh: Senin, 12 Juni 2023
    }
  }
}
