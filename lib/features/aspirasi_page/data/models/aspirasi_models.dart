class Aspirasi {
  final int id;
  final int userId;
  final String jenisAspirasi;
  final String programStudi;
  final String keterangan;
  final int? rating;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isAnonymous;

  Aspirasi({
    required this.id,
    required this.userId,
    required this.jenisAspirasi,
    required this.programStudi,
    required this.keterangan,
    this.rating,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.isAnonymous,
  });

  factory Aspirasi.fromJson(Map<String, dynamic> json) {
    return Aspirasi(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      jenisAspirasi: json['jenis_aspirasi'] ?? '',
      programStudi: json['program_studi'] ?? '',
      keterangan: json['keterangan'] ?? '',
      rating: json['rating'] != null
          ? int.tryParse(json['rating'].toString()) ?? 0
          : null,
      status: json['status'] ?? '',
      createdAt: DateTime.parse(
          json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(
          json['updated_at'] ?? DateTime.now().toIso8601String()),
      isAnonymous:
          json['is_anonymous'] == 1, // Convert string "1" to boolean true
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'jenis_aspirasi': jenisAspirasi,
      'program_studi': programStudi,
      'keterangan': keterangan,
      'rating': rating,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'is_anonymous': isAnonymous ? 1 : 0, // Convert boolean to '1' or '0'
    };
  }
}
