import 'package:swifty/models/projectModel.dart';
import 'package:swifty/models/skillsModel.dart';

class UserModel {
  final int id;
  final String login;
  final String kind;
  final String fullName;
  final String email;
  final String? profilePicture;
  final int correctionPoint;
  final int wallet;
  final List<SkillsModel>? skills;
  final List<ProjectModel>? projects;
  final double level;

  UserModel({
    required this.id,
    required this.login,
    required this.kind,
    required this.fullName,
    required this.email,
    required this.profilePicture,
    required this.correctionPoint,
    required this.wallet,
    required this.level,
    required this.skills,
    required this.projects
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      login: json['login'] ??  "login",
      kind: setKind(json['kind']),
      fullName: json['usual_full_name'] ?? "Prénom Nom",
      email: json['email'] ?? "email@exemple.fr",
      profilePicture: json['image']['versions']['small'],
      correctionPoint: json['correction_point'] ?? 0,
      wallet: json['wallet'] ?? 0,
      level: setLevel(json),
      skills: setSkills(json),
      projects: setProjects(json)
    );
  }

  static String setKind(kind)
  {
    switch (kind) {
      case "admin":
        kind = "Admin";
        break;

      case "student":
        kind = "Etudiant";

      default :
        kind = "Indéfini";
    }
    return kind;
  }

  static List<SkillsModel>? setSkills(json) {
    int cursus = json['cursus_users'].length - 1;
    if (cursus > 1) {
      cursus = 0;
    }
    return ((json['cursus_users'][cursus]['skills'] as List<dynamic>)
            .map((skillJson) => SkillsModel.fromJson(skillJson))
            .toList());
  }

  static List<ProjectModel>? setProjects(json) {
    if (json.containsKey('projects_users') && json["projects_users"].length != 0) {
      return ((json['projects_users'] as List<dynamic>)
          .map((projectJson) => ProjectModel.fromJson(projectJson))
          .toList());
    } else {
      return null;
    }
  }

  static double setLevel(json) {
    if (json.containsKey('cursus_users')) {
      int index = json['cursus_users'].length;
      if (index > 3) { index = 3; }
      return json['cursus_users'][index - 1]['level'];
    }
    return 0;
  }
}