import 'package:usmhub_v1/features/settings_page/data/models/user_model.dart';

class Feed {
  final int id;
  final String kategori;
  final String judul;
  final String deskripsi;
  final String? imgbanner;
  final String? docfeed;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int userId; // User ID
  final User user;

  Feed({
    required this.id,
    required this.kategori,
    required this.judul,
    required this.deskripsi,
    this.imgbanner,
    this.docfeed,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.user,
  });

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
      id: json['id'],
      kategori: json['kategori'],
      judul: json['judul'],
      deskripsi: json['deskripsi'],
      docfeed: json['doc_feed'],
      imgbanner: json['img_banner'],
      createdAt: DateTime.parse(
          json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(
          json['updated_at'] ?? DateTime.now().toIso8601String()),
      userId: json['user_id'],
      user: User.fromJson(json['user']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'kategori': kategori,
      'judul': judul,
      'deskripsi': deskripsi,
      'doc_feed': docfeed ?? '',
      'img_banner': imgbanner ?? '',
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'user_id': userId.toString(),
    };
  }
}
