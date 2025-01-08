import 'dart:convert';
import 'package:http/http.dart' as http;

class Api42Auth {
  final String clientId;
  final String clientSecret;

  Api42Auth({required this.clientId, required this.clientSecret});

  Future<String?> getAccessToken() async {
    final url = Uri.parse('https://api.intra.42.fr/oauth/token');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'grant_type': 'client_credentials',
        'client_id': clientId,
        'client_secret': clientSecret,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['access_token'];
    } else {
      print('Erreur lors de l\'obtention du token : ${response.body}');
      return null;
    }
  }
}
