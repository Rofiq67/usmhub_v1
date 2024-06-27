class User {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String imgProfile;
  final DateTime? tglLahir; // Nullable DateTime
  final String progdi;
  final String gender;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.imgProfile,
    this.tglLahir,
    required this.progdi,
    required this.gender,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      imgProfile: json['img_profile'] ?? '',
      tglLahir:
          json['tgl_lahir'] != null ? DateTime.parse(json['tgl_lahir']) : null,
      progdi: json['progdi'] ?? '',
      gender: json['gender'] ?? '',
    );
  }

  toJson() {}

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id.toString(),
  //     'first_name': lastName,
  //     'last_name': lastName,
  //     'username': username,
  //     'email': email,
  //     'img_profile': imgProfile,
  //     'tgl_lahir': tglLahir?.toIso8601String(),
  //     'progdi': progdi,
  //     'gender': gender,
  //   };
  // }
}
