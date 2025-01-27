// views/user_view.dart
import 'package:flutter/material.dart';
import '../controllers/user_controller.dart';
import '../data/models/user.dart';
import '../data/repositories/user_repository.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late UserController controller;
  bool isLoading = false;
  User? user;
  String? errorMessage;

  @override
  void initState() {
    super.initState();

    // Inicializa o Controller
    controller = UserController(repository: UserRepository());
    controller.onLoading = (loading) {
      setState(() {
        isLoading = loading;
      });
    };
    controller.onUserLoaded = (fetchedUser) {
      setState(() {
        user = fetchedUser;
        errorMessage = null;
      });
    };
    controller.onError = (message) {
      setState(() {
        errorMessage = message;
        user = null;
      });
    };

    // Carrega os dados do usuário
    controller.loadUser();
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
                  : const Center(child: const Text('No data')),
    );
  }
}
