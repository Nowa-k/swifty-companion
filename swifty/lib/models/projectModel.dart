class ProjectModel {
  final String name;
  final double note;
  final String status;
  final bool validated;

  ProjectModel({
    required this.name,
    required this.note,
    required this.status,
    required this.validated
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
        name: json['project']['name'] ?? "Empty",
        note: (json['final_mark'] as num?)?.toDouble() ?? 0.0,
        status: json['status'] ?? "Wait",
        validated: json['validated'] ?? true,
    );
  }
}
