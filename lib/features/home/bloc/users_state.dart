import 'package:equatable/equatable.dart';
import '../models/user.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoaded extends UsersState {
  final List<User> users;
  const UsersLoaded(this.users);

  @override
  List<Object> get props => [users];
}
