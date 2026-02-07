import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_design_patterns/mvvm/data/repositories/user_repository.dart';
import 'package:flutter_design_patterns/mvvm/presentation/viewmodels/user_viewmodel.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserViewModel(repository: UserRepository()),
      child: Scaffold(
        appBar: AppBar(title: const Text('User Info - MVVM')),
        body: Consumer<UserViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (viewModel.error != null) {
              return Center(child: Text(viewModel.error!));
            }

            final user = viewModel.user;
            if (user == null) {
              return const Center(child: Text('No user loaded'));
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name: ${user.name}'),
                Text('Age: ${user.age}'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    viewModel.updateUser('Alice', 25);
                  },
                  child: const Text('Update User'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    viewModel.loadUser();
                  },
                  child: const Text('Reload User'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
