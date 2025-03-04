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
        status: setStatusFr(json['status']),
        validated: json['validated?'] ?? true
    );
  }

  static String setStatusFr(String status) {
    switch (status) {
      case "finished" :
        status = "Terminer";
        break;

      case "in_progress" :
        status = "En cours";
        break;

      case "searching_a_group":
        status = "Cherche un groupe";
        break;

      case "waiting_for_correction":
        status = "Cherche une correction";
        break;

      case "creating_group":
        status = "Création d'un groupe";
        break;

      default :
        print(status);
        status = "Indéfini";
    }
    return (status);
  }
}
