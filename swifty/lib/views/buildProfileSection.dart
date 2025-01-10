import 'package:flutter/material.dart';
import '../models/userModel.dart';

Widget buildProfileSection(UserModel user) {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Column(
          children: [
            buildAvatar(user.profilePicture),
            SizedBox(height: 16),
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
          ]
        ),
      ),
      SizedBox(height: 8),
      Column(
        children: [
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
              "${user.email}",
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.deepPurple[400],
              ),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Text(
              "Level: ${user.level}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.deepPurple[400],
              ),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Ajoute un padding autour du texte
              decoration: BoxDecoration(
                color: Colors.white, // Fond blanc
                borderRadius: BorderRadius.circular(12), // Coins arrondis
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), // Ombre légère
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: Offset(0, 4), // Décalage de l'ombre
                  ),
                ],
              ),
              child: Text(
                "${user.kind}",
                style: TextStyle(
                  fontSize: 18, // Augmenter la taille pour une meilleure lisibilité
                  fontWeight: FontWeight.bold, // Texte en gras
                  color: Colors.deepPurple[400], // Couleur du texte
                ),
              ),
            ),
          ),
        ],
      )
    ],
  );
}

Widget buildAvatar(String? avatar) {
  if (avatar == null) {
    return Icon(
      Icons.person,
      size: 60,
      color: Colors.grey[400],
    );
  } else {
    return Center(
      child: CircleAvatar(
        radius: 60,
        backgroundImage: NetworkImage(avatar),
      ),
    );
  }
}