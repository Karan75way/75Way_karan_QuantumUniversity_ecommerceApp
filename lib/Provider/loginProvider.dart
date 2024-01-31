import 'package:flutter/material.dart';
import 'registrationProvider.dart';

class LoginProvider extends ChangeNotifier {
  RegistrationProvider _registrationProvider;

  LoginProvider(this._registrationProvider);

  String? _loggedInUser;

  String? get loggedInUser => _loggedInUser;

  Future<void> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));

    final isUserRegistered = _registrationProvider.registeredUsers.any(
      (user) => user.email == email && _isPasswordCorrect(user, password),
    );

    if (isUserRegistered) {
      _loggedInUser = email;
      notifyListeners();
    } else {
      throw Exception('Invalid username or password');
    }
  }

  Future<void> logout() async {
    await Future.delayed(Duration(seconds: 1));

    _loggedInUser = null;
    notifyListeners();
  }

  bool _isPasswordCorrect(User user, String password) {
    return user.password == password;
  }
}
