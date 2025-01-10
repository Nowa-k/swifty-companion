import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swifty/models/userModel.dart';

class Api {
  final String baseUrl = 'https://api.intra.42.fr/v2';
  final String accessToken;

  Api(this.accessToken);

  Future<UserModel?> getUser(String username) async {
    final url = Uri.parse('$baseUrl/users/$username');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      return UserModel.fromJson(json);
    } else {
      print('Erreur lors de la requête GET : ${response.body}');
      return null;
    }
  }
}