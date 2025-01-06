import 'package:flutter/material.dart';
import '../models/userModel.dart';
import '../services/apiService.dart';

class UserViewModel extends ChangeNotifier {

  final Api _api = Api();
  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> fetchUser (String username) async {
    _isLoading = true;
    notifyListeners();

    _user = await _api.fetchUser(username);

    _isLoading = false;
    notifyListeners();
  }
}