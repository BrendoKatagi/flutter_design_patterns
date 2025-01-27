import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/mvp/data/repositories/user_repository.dart';
import 'package:flutter_design_patterns/mvp/data/models/user.dart';
import '../presenters/user_presenter.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> implements UserViewContract {
  late UserPresenter presenter;
  bool isLoading = false;
  User? user;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    presenter = UserPresenter(this, UserRepository());
    presenter.loadUser();
  }

  @override
  void showLoading() {
    setState(() {
      isLoading = true;
    });
  }

  @override
  void hideLoading() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void showUser(User user) {
    setState(() {
      this.user = user;
      errorMessage = null;
    });
  }

  @override
  void showError(String message) {
    setState(() {
      errorMessage = message;
      user = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Info')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(child: Text(errorMessage!))
              : user != null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Name: ${user!.name}'),
                          Text('Age: ${user!.age}'),
                        ],
                      ),
                    )
                  : const Center(child: Text('No data')),
    );
  }
}
