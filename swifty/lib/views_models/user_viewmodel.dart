import 'package:flutter/material.dart';
import 'package:swifty/services/api42Auth.dart';
import '../models/userModel.dart';
import '../services/apiService.dart';

class UserViewModel extends ChangeNotifier {
  final String clientId = "u-s4t2ud-2ade3757224fd860db86998ca5f317248a0ceb942ba2d474b98b70e26612a18e";
  final String clientSecret = "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";

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