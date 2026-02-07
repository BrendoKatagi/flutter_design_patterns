part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoaded extends UserState {
  final String name;
  final int age;

  UserLoaded({required this.name, required this.age});
}
