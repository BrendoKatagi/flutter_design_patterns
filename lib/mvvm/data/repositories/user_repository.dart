import '../models/user.dart';

class UserRepository {
  Future<User> fetchUser() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    return User(name: 'John Doe', age: 30);
  }
}
