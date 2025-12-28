import 'package:bloc_test/bloc_test.dart';
import 'package:chat_ai/features/home/bloc/home_toggle_bloc.dart';
import 'package:chat_ai/features/home/bloc/home_toggle_event.dart';
import 'package:chat_ai/features/home/bloc/home_toggle_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeToggleBloc', () {
    late HomeToggleBloc homeToggleBloc;

    setUp(() {
      homeToggleBloc = HomeToggleBloc();
    });

    tearDown(() {
      homeToggleBloc.close();
    });

    test('initial state is HomeToggleLoaded with index 0', () {
      expect(homeToggleBloc.state, const HomeToggleLoaded(0));
    });

    blocTest<HomeToggleBloc, HomeToggleState>(
      'emits [HomeToggleLoaded(1)] when HomeToggleChanged(1) is added',
      build: () => homeToggleBloc,
      act: (bloc) => bloc.add(HomeToggleChanged(1)),
      expect: () => [isA<HomeToggleLoaded>()],
      verify: (bloc) => expect(bloc.state.selectedIndex, 1),
    );

    blocTest<HomeToggleBloc, HomeToggleState>(
      'emits [HomeToggleLoaded(0)] when HomeToggleChanged(0) is added',
      build: () => homeToggleBloc,
      act: (bloc) => bloc.add(HomeToggleChanged(0)),
      expect: () => [isA<HomeToggleLoaded>()],
      verify: (bloc) => expect(bloc.state.selectedIndex, 0),
    );
  });
}