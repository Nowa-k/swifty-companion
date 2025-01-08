import 'package:flutter/material.dart';
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
        Expanded(
          child: ListView.builder(
            itemCount: user.projects.length,
            itemBuilder: (context, index) {
              final project = user.projects[index];
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
                      color: !project.validated && project.status == "finished" ? Colors.red : Colors.green,
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
