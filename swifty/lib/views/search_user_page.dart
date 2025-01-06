import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../views_models/user_viewmodel.dart';
import 'user_detail_page.dart';

class SearchUserPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rechercher un utilisateur")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Nom d'utilisateur",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final username = _controller.text.trim();
                if (username.isNotEmpty) {
                  Provider.of<UserViewModel>(context, listen: false).fetchUser(username).then((_) {
                    final user = Provider.of<UserViewModel>(context, listen: false).user;
                    if (user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserDetailPage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Utilisateur introuvable.')),
                      );
                    }
                  });
                }
              },
              child: Text("Rechercher"),
            ),
          ],
        ),
      ),
    );
  }
}
