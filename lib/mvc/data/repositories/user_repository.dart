import 'package:flutter_design_patterns/mvc/data/models/user.dart';

class UserRepository {
  Future<User> fetchUser() async {
    // Simula uma requisição (exemplo: API ou banco de dados)
    await Future.delayed(const Duration(seconds: 2));
    return User(name: 'Alice', age: 25);
  }
}
