import "dart:convert";
import 'package:http/http.dart' as http;
import '../models/userModel.dart';
import 'dart:developer';

class Api {
  final String baseUrl = "https://api.intra.42.fr/oauth/token";

  Future<UserModel?> fetchUser(String username) async {
    try {
      final url = Uri.parse('$baseUrl');
      final response = await http.post(
        url,
        body: jsonEncode({
          'grant_type': 'client_credentials',
          'client_id': "u-s4t2ud-2ade3757224fd860db86998ca5f317248a0ceb942ba2d474b98b70e26612a18e",
          'client_secret': "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",
        }),
      );

      final responseToken = jsonDecode(response.body);
      print("Body ${responseToken['access_token']}");


      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("Parsed Data: $data"); // Log des données analysées
        return UserModel.fromJson(data);
      } else {
        print("Error: ${response.reasonPhrase}");
        return null;
      }
    } catch (e) {
      print('Erreur de connexion: $e');
      return null;
    }
  }
}