import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/mvvm/data/models/user.dart';
import 'package:flutter_design_patterns/mvvm/data/repositories/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository repository;
  User? _user;
  bool _isLoading = false;
  String? _error;

  UserViewModel({required this.repository});

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadUser() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _user = await repository.fetchUser();
    } catch (e) {
      _error = 'Failed to load user data.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void updateUser(String name, int age) {
    _user = User(name: name, age: age);
    notifyListeners();
  }
}
