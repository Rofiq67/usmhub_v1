class ForwardModels {
  final String fromProgramStudi;
  final String toProgramStudi;
  final DateTime createdAt;

  ForwardModels({
    required this.fromProgramStudi,
    required this.toProgramStudi,
    required this.createdAt,
  });

  factory ForwardModels.fromJson(Map<String, dynamic> json) {
    return ForwardModels(
      fromProgramStudi: json['from_program_studi'],
      toProgramStudi: json['to_program_studi'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
