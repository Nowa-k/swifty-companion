import 'package:flutter/material.dart';

class UserInformation extends StatelessWidget {
  final String inputText; // Propriété pour récupérer la donnée

  const UserInformation({super.key, required this.inputText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information $inputText'),
        backgroundColor: const Color(0xFF800080),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You entered: $inputText',
              style: const TextStyle(fontSize: 24, color: Colors.purple),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
