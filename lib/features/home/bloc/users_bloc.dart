import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

import 'users_event.dart';
import 'users_state.dart';
import '../models/user.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<LoadUsers>(_onLoadUsers);
    on<AddUser>(_onAddUser);
  }

  final List<User> _users = [
    User(name: 'Emma Wilson', status: 'online'),
    User(name: 'Cameron Perez', status: '5 min ago'),
    User(name: 'Emily Johnson', status: '12 min ago'),
    User(name: 'Brayden Fleming', status: 'online'),
    User(name: 'Wyatt Perry', status: '2 min ago'),
    User(name: 'Daniel Taylor', status: 'online'),
    User(name: 'James Davis', status: '8 min ago'),
    User(name: 'Luke Cooper', status: 'online'),
    User(name: 'Jace Smith', status: '15 min ago'),
    User(name: 'Nora Mills', status: 'online'),
    User(name: 'Mateo Bennett', status: '3 min ago'),
    User(name: 'Scarlett Bowman', status: 'online'),
    User(name: 'Hunter Gordon', status: '10 min ago'),
    User(name: 'Jonathan Pierce', status: 'online'),
    User(name: 'Evelyn Sanchez', status: 'online'),
    User(name: 'Vivian Carter', status: '7 min ago'),
    User(name: 'Nicholas Edwards', status: 'online'),
    User(name: 'Nora Russell', status: '12 min ago'),
    User(name: 'Nova Cooper', status: 'online'),
    User(name: 'Lucas Gray', status: 'online'),
    User(name: 'Mia Miller', status: '5 min ago'),
    User(name: 'Jaxon Barnes', status: 'online'),
    User(name: 'Claire Foster', status: 'online'),
    User(name: 'Ethan Fletcher', status: 'online'),
    User(name: 'Nathan Dixon', status: '12 min ago'),
    User(name: 'Xavier Wright', status: 'online'),
    User(name: 'Luna Perez', status: '5 min ago'),
    User(name: 'Brayden Fleming', status: 'online'),
  ];

  void _onLoadUsers(LoadUsers event, Emitter<UsersState> emit) {
    emit(UsersLoaded(List.from(_users)));
  }

  void _onAddUser(AddUser event, Emitter<UsersState> emit) {
    final random = Random();
    final statuses = ['online', '5 min ago', '10 min ago', '15 min ago'];
    final status = statuses[random.nextInt(statuses.length)];

    final newUser = User(name: event.name, status: status);
    _users.add(newUser);
    emit(UsersLoaded(List.from(_users)));
  }
}
