class SkillsModel {
  final String name;
  final double level;

  SkillsModel({
    required this.name,
    required this.level,
  });

  factory SkillsModel.fromJson(Map<String, dynamic> json) {
    return SkillsModel(
      name: json['name'],
      level: (json['level'] as num).toDouble()
    );
  }
}