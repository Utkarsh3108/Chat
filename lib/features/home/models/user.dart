import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String status;

  const User({required this.name, required this.status});

  @override
  List<Object> get props => [name, status];
}
