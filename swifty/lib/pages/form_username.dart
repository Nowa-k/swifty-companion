import 'package:flutter/material.dart';
import 'user_information.dart';

class FormUsername extends StatefulWidget {
  const FormUsername({super.key});

  @override
  State<FormUsername> createState() => _FormUsernameState();
}

class _FormUsernameState extends State<FormUsername> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: myController,
            style: const TextStyle(color: Color(0xFF800080)),
            decoration: const InputDecoration(
              labelText: 'Entrer un login',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            String enteredText = myController.text;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserInformation(inputText: enteredText), // Passage des données à la seconde page
              ),
            );
          },
          child: const Text('Chercher'),
        ),
      ],
    );
  }
}
