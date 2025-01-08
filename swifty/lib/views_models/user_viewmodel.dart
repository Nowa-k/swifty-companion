import 'package:flutter/material.dart';
import 'package:swifty/services/api42Auth.dart';
import '../models/userModel.dart';
import '../services/apiService.dart';

class UserViewModel extends ChangeNotifier {

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