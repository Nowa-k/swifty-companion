import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../views_models/user_viewmodel.dart';
import 'user_detail_page.dart';

class SearchUserPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swifty Companion",
          style: TextStyle(
            color: Colors.white,
        ),
      ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                "Bienvenue dans Swifty Companion",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                "Recherchez un utilisateur en entrant son login.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepPurple[400],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Entrer un login",
                  labelStyle: TextStyle(
                    color: Colors.deepPurple[200],
                    fontStyle: FontStyle.italic,
                  ),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person, color: Colors.deepPurple),
                  filled: true,
                  fillColor: Colors.deepPurple[50],
                ),
                style: TextStyle(
                  color: Colors.deepPurple[400]
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  final username = _controller.text.trim();
                  if (username.isNotEmpty) {
                    Provider.of<UserViewModel>(context, listen: false)
                        .fetchUser(username)
                        .then((_) {
                      final user = Provider.of<UserViewModel>(context, listen: false).user;
                      if (user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserDetailPage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Utilisateur introuvable.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: Text("Rechercher",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
