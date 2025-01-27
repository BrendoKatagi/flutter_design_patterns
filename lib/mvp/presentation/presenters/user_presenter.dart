import 'package:flutter_design_patterns/mvp/data/repositories/user_repository.dart';
import 'package:flutter_design_patterns/mvp/data/models/user.dart';

abstract class UserViewContract {
  void showLoading();
  void hideLoading();
  void showUser(User user);
  void showError(String message);
}

class UserPresenter {
  final UserViewContract view;
  final UserRepository repository;

  UserPresenter(this.view, this.repository);

  void loadUser() async {
    view.showLoading();
    try {
      final user = await repository.fetchUser();
      view.showUser(user);
    } catch (e) {
      view.showError('Failed to load user data.');
    } finally {
      view.hideLoading();
    }
  }
}
