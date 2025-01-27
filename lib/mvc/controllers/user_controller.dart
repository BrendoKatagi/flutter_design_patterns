import 'package:flutter_design_patterns/mvc/data/models/user.dart';
import 'package:flutter_design_patterns/mvc/data/repositories/user_repository.dart';

class UserController {
  final UserRepository repository;
  late Function(User) onUserLoaded;
  late Function(String) onError;
  late Function(bool) onLoading;

  UserController({required this.repository});

  void loadUser() async {
    onLoading(true); // Informa à View que o carregamento começou
    try {
      final user = await repository.fetchUser();
      onUserLoaded(user); // Envia os dados do usuário para a View
    } catch (e) {
      onError('Failed to load user data.');
    } finally {
      onLoading(false); // Informa à View que o carregamento terminou
    }
  }
}
