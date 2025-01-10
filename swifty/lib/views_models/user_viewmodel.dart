import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:swifty/services/api42Auth.dart';
import '../models/userModel.dart';
import '../services/apiService.dart';

class UserViewModel extends ChangeNotifier {
  final String? clientId = dotenv.env['CLIENT_ID'];
  final String? clientSecret = dotenv.env['CLIENT_SECRET'];

  late Api42Auth _auth = Api42Auth(clientId: this.clientId, clientSecret: this.clientSecret);
  late Api _api;
  String? _token;

  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> fetchUser (String username) async {
    _isLoading = true;
    notifyListeners();

    _token = await _auth.getAccessToken();
    _api = Api(_token!);
    _user = await _api.getUser(username);

    _isLoading = false;
    notifyListeners();
  }
}