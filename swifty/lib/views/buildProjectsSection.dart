import 'package:flutter/material.dart';
import '../models/projectModel.dart';
import '../models/userModel.dart';

Widget buildProjectsSection(UserModel user) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Projets :",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple[700],
          ),
        ),
        SizedBox(height: 8),
        buildProjects(user.projects)
      ],
    ),
  );
}

Widget buildProjects(List<ProjectModel>? projects) {
  if (projects == null) {
    return Center(
      child: Text(
        "Aucun projets trouvée.",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  } else {
    return Expanded(
      child: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Card(
            color: Colors.deepPurple[100],
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(Icons.folder, color: Colors.deepPurple),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[700],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Status : ${project.status}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.deepPurple[600],
                    ),
                  ),
                ],
              ),
              trailing: Text(
                "Note : ${project.note.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 14,
                  color: project.status != "Terminer"
                      ? Colors.deepPurple[400]
                      : (project.status == "Terminer" && !project.validated)
                      ? Colors.red
                      : Colors.green,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}