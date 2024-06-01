class Aspirasi {
  final int id;
  final int userId;
  final String jenisAspirasi;
  final String programStudi;
  final String keterangan;
  final int? rating;
  final String status;

  Aspirasi({
    required this.id,
    required this.userId,
    required this.jenisAspirasi,
    required this.programStudi,
    required this.keterangan,
    this.rating,
    required this.status,
  });

  factory Aspirasi.fromJson(Map<String, dynamic> json) {
    return Aspirasi(
      id: json['id'],
      userId: json['user_id'],
      jenisAspirasi: json['jenis_aspirasi'],
      programStudi: json['program_studi'],
      keterangan: json['keterangan'],
      rating: json['rating'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'jenis_aspirasi': jenisAspirasi,
      'program_studi': programStudi,
      'keterangan': keterangan,
      'rating': rating,
      'status': status,
    };
  }
}
