class Feed {
  final int id;
  final String kategori;
  final String judul;
  final String deskripsi;
  final String? imgbanner;
  final String? docfeed;
  final bool status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Feed({
    required this.id,
    required this.kategori,
    required this.judul,
    required this.deskripsi,
    this.imgbanner,
    this.docfeed,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
      id: json['id'],
      kategori: json['kategori'],
      judul: json['judul'],
      deskripsi: json['deskripsi'],
      docfeed: json['doc_feed'],
      imgbanner: json['img_banner'],
      status: json['status'],
      createdAt: DateTime.parse(
          json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(
          json['updated_at'] ?? DateTime.now().toIso8601String()),
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
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
