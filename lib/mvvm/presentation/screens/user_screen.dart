import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_design_patterns/mvvm/presentation/cubits/user_cubit.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('User Info')),
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            final user = state as UserLoaded;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name: ${user.name}'),
                Text('Age: ${user.age}'),
                ElevatedButton(
                  onPressed: () {
                    context.read<UserCubit>().updateUser('Alice', 25);
                  },
                  child: const Text('Update User'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
