import 'package:flutter/material.dart';
import '../models/userModel.dart';

Widget buildProfileSection(UserModel user) {
  return Column(
    children: [
      Center(
        child: CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(user.profilePicture),
        ),
      ),
      SizedBox(height: 16),
      Center(
        child: Text(
          user.fullName,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple[800],
          ),
        ),
      ),
      SizedBox(height: 8),
      Center(
        child: Text(
          "@${user.login}",
          style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            color: Colors.deepPurple[400],
          ),
        ),
      ),
    ],
  );
}
