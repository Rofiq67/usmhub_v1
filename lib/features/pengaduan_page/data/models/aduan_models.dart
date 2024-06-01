class Aduan {
  final int id;
  final int userId;
  final String jenisPengaduan;
  final String programStudi;
  final String keterangan;
  final int? rating;
  final String? buktiPhoto;
  final String status;

  Aduan({
    required this.id,
    required this.userId,
    required this.jenisPengaduan,
    required this.programStudi,
    required this.keterangan,
    this.rating,
    this.buktiPhoto,
    required this.status,
  });

  factory Aduan.fromJson(Map<String, dynamic> json) {
    return Aduan(
      id: json['id'],
      userId: json['user_id'],
      jenisPengaduan: json['jenis_pengaduan'],
      programStudi: json['program_studi'],
      keterangan: json['keterangan'],
      rating: json['rating'],
      buktiPhoto: json['bukti_photo'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'jenisPengaduan': jenisPengaduan,
      'programStudi': programStudi,
      'keterangan': keterangan,
      'rating': rating,
      'buktiPhoto': buktiPhoto,
      'status': status,
    };
  }
}
