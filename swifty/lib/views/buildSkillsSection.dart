import 'package:flutter/material.dart';
import '../models/userModel.dart';

Widget buildSkillsSection(UserModel user) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Compétences :",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple[700],
          ),
        ),
        SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: user.skills.length,
            itemBuilder: (context, index) {
              final skill = user.skills[index];
              return Card(
                color: Colors.deepPurple[100],
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: Icon(Icons.star, color: Colors.deepPurple),
                  title: Text(
                    skill.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[700],
                    ),
                  ),
                  trailing: Text(
                    "Niveau : ${skill.level.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.deepPurple[600],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
