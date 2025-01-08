import '../models/userModel.dart';
import 'package:flutter/material.dart';

Widget buildStatsSection(UserModel user) {
  return Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child : Text(
                "Points de Correction",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[700],
                ),
              ),
            ),
            Center(
              child : Text(
                "${user.correctionPoint}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepPurple[700],
                ),
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child : Text(
                "Wallet",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[700],
                ),
              ),
            ),
            Center(
              child : Text(
                "${user.wallet}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepPurple[700],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
