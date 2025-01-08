import '../models/userModel.dart';
import 'package:flutter/material.dart';

Widget buildStatsSection(UserModel user) {
  return Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Points de Correction :",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[700],
              ),
            ),
            Text(
              "${user.correctionPoint}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.deepPurple[500],
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Wallet :",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[700],
              ),
            ),
            Text(
              "${user.wallet}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.deepPurple[500],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
