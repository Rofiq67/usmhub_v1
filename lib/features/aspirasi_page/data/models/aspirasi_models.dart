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
  });

  factory Aspirasi.fromJson(Map<String, dynamic> json) {
    return Aspirasi(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      jenisAspirasi: json['jenis_aspirasi'] ?? '',
      programStudi: json['program_studi'] ?? '',
      keterangan: json['keterangan'] ?? '',
      rating: json['rating'] ?? 0,
      status: json['status'] ?? '',
      createdAt: DateTime.parse(
          json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(
          json['updated_at'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'user_id': userId.toString(),
      'jenis_aspirasi': jenisAspirasi,
      'program_studi': programStudi,
      'keterangan': keterangan,
      'rating': rating?.toString() ?? '0',
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
