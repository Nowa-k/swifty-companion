import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../views_models/user_viewmodel.dart';

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
      appBar: AppBar(title: Text("Détails de ${user.name}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nom: ${user.name}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Email: ${user.email}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Username: ${user.username}", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
