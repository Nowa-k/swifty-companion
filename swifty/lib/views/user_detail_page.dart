import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../views_models/user_viewmodel.dart';
import 'buildProfileSection.dart';
import 'buildProjectsSection.dart';
import 'buildStatsSection.dart';
import 'buildSkillsSection.dart';

class UserDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserViewModel>(context).user;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Détails Utilisateur")),
        body: Center(child: Text("Aucun utilisateur trouvé.")),
      );
    }

    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text("Profil Utilisateur",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildProfileSection(user),
            SizedBox(height: 16),
            Divider(color: Colors.deepPurple[300]),
            SizedBox(height: 8),
            buildStatsSection(user),
            SizedBox(height: 8),
            Divider(color: Colors.deepPurple[300]),
            SizedBox(height: 8),
            buildSkillsSection(user),
            Divider(color: Colors.deepPurple[300]),
            SizedBox(height: 8),
            buildProjectsSection(user),
          ],
        ),
      ),
    );
  }
}
