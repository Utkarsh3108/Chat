import 'package:bloc_test/bloc_test.dart';
import 'package:chat_ai/features/navigation/bloc/navigation_bloc.dart';
import 'package:chat_ai/features/navigation/bloc/navigation_event.dart';
import 'package:chat_ai/features/navigation/bloc/navigation_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NavigationBloc', () {
    late NavigationBloc navigationBloc;

    setUp(() {
      navigationBloc = NavigationBloc();
    });

    tearDown(() {
      navigationBloc.close();
    });

    test('initial state is NavigationLoaded with index 0', () {
      expect(navigationBloc.state, const NavigationLoaded(0));
    });

    blocTest<NavigationBloc, NavigationState>(
      'emits [NavigationLoaded(1)] when NavigationTabChanged(1) is added',
      build: () => navigationBloc,
      act: (bloc) => bloc.add(NavigationTabChanged(1)),
      expect: () => [isA<NavigationLoaded>()],
      verify: (bloc) => expect(bloc.state.currentIndex, 1),
    );

    blocTest<NavigationBloc, NavigationState>(
      'emits [NavigationLoaded(2)] when NavigationTabChanged(2) is added',
      build: () => navigationBloc,
      act: (bloc) => bloc.add(NavigationTabChanged(2)),
      expect: () => [isA<NavigationLoaded>()],
      verify: (bloc) => expect(bloc.state.currentIndex, 2),
    );
  });
}