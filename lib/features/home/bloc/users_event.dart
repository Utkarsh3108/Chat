import 'package:equatable/equatable.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class LoadUsers extends UsersEvent {}

class AddUser extends UsersEvent {
  final String name;
  const AddUser(this.name);

  @override
  List<Object> get props => [name];
}


