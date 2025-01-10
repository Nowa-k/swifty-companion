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
    print("Top of setskills");
    if (json.containsKey('cursus_users')) {
      print(json['cursus_users'][0]['skills'].length);
      switch (json['cursus_users'].length) {
        case 2 :
          return ((json['cursus_users'][1]['skills'] as List<dynamic>)
              .map((skillJson) => SkillsModel.fromJson(skillJson))
              .toList());

        case 1 :
          if (json['cursus_users'][0]['skills'].length != 0) {
            return ((json['cursus_users'][0]['skills'] as List<dynamic>)
                .map((skillJson) => SkillsModel.fromJson(skillJson))
                .toList());
          } else {
            return null;
          }

        default :
          return null;
      }
    }
    return null;
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
      switch (json['cursus_users'].length) {
        case 2 :
          return json['cursus_users'][1]['level'];

        case 1 :
          return json['cursus_users'][0]['level'];

        default :
          return 0;
      }
    }
    return 0;
  }
}