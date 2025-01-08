import 'package:swifty/models/projectModel.dart';
import 'package:swifty/models/skillsModel.dart';

class UserModel {
  final int id;
  final String login;
  final String fullName;
  final String email;
  final String profilePicture;
  final int correctionPoint;
  final int wallet;
  final List<SkillsModel> skills;
  final List<ProjectModel> projects;
  //final double level;

  UserModel({
    required this.id,
    required this.login,
    required this.fullName,
    required this.email,
    required this.profilePicture,
    required this.correctionPoint,
    required this.wallet,
    /*required this.level,*/
    required this.skills,
    required this.projects
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      login: json['login'],
      fullName: json['usual_full_name'],
      email: json['email'],
      profilePicture: json['image']['versions']['small'],
      correctionPoint: json['correction_point'],
      wallet: json['wallet'],
      // level: json['level']
      skills: (json['cursus_users'][0]['skills'] as List<dynamic>)
          .map((skillJson) => SkillsModel.fromJson(skillJson))
          .toList(),
      projects: (json['projects_users'] as List<dynamic>)
          .map((projectJson) => ProjectModel.fromJson(projectJson))
          .toList(),
    );
  }
}
