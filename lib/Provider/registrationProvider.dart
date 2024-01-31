import 'package:flutter/material.dart';

class RegistrationProvider extends ChangeNotifier {
  List<User> _registeredUsers = [];

  List<User> get registeredUsers => _registeredUsers;

  Future<void> registerUser(String name, String email, String password) async {
    await Future.delayed(Duration(seconds: 2));

    if (!_registeredUsers.any((user) => user.email == email)) {
      _registeredUsers.add(User(name: name, email: email, password: password));
      notifyListeners();
    } else {
      throw Exception(
          'Username already exists. Please choose a different one.');
    }
  }
}

class User {
  final String name;
  final String email;
  final String password;

  User({
    required this.name,
    required this.email,
    required this.password,
  });
}
