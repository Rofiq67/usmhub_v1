class Aduan {
  final int id;
  final int userId;
  final String jenisPengaduan;
  final String programStudi;
  final String keterangan;
  final int? rating;
  final String? buktiPhoto;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isAnonymous;

  Aduan({
    required this.id,
    required this.userId,
    required this.jenisPengaduan,
    required this.programStudi,
    required this.keterangan,
    this.rating,
    this.buktiPhoto,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.isAnonymous,
  });

  factory Aduan.fromJson(Map<String, dynamic> json) {
    return Aduan(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      jenisPengaduan: json['jenis_pengaduan'] ?? '',
      programStudi: json['program_studi'] ?? '',
      keterangan: json['keterangan'] ?? '',
      rating: json['rating'] ?? 0,
      buktiPhoto: json['bukti_photo'] ?? '',
      status: json['status'] ?? '',
      createdAt: DateTime.parse(
          json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(
          json['updated_at'] ?? DateTime.now().toIso8601String()),
      isAnonymous: json['is_anonymous'] == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'user_id': userId.toString(),
      'jenis_pengaduan': jenisPengaduan,
      'program_studi': programStudi,
      'keterangan': keterangan,
      'rating': rating?.toString() ?? '0',
      'bukti_photo': buktiPhoto ?? '',
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'is_anonymous': isAnonymous ? 1 : 0,
    };
  }
}
