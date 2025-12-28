import 'package:bloc_test/bloc_test.dart';
import 'package:chat_ai/features/home/bloc/users_bloc.dart';
import 'package:chat_ai/features/home/bloc/users_event.dart';
import 'package:chat_ai/features/home/bloc/users_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UsersBloc', () {
    late UsersBloc usersBloc;

    setUp(() {
      usersBloc = UsersBloc();
    });

    tearDown(() {
      usersBloc.close();
    });

    test('initial state is UsersInitial', () {
      expect(usersBloc.state, UsersInitial());
    });

    blocTest<UsersBloc, UsersState>(
      'emits [UsersLoaded] when LoadUsers is added',
      build: () => usersBloc,
      act: (bloc) => bloc.add(LoadUsers()),
      expect: () => [
        isA<UsersLoaded>(),
      ],
      verify: (bloc) {
        final state = bloc.state as UsersLoaded;
        expect(state.users.length, 28);
        expect(state.users.first.name, 'Emma Wilson');
      },
    );

    blocTest<UsersBloc, UsersState>(
      'emits [UsersLoaded] with new user when AddUser is added',
      build: () => usersBloc,
      act: (bloc) => bloc.add(AddUser('Test User')),
      expect: () => [
        isA<UsersLoaded>(),
      ],
      verify: (bloc) {
        final state = bloc.state as UsersLoaded;
        expect(state.users.last.name, 'Test User');
      },
    );
  });
}