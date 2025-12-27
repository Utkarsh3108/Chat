import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_toggle_event.dart';
import 'home_toggle_state.dart';

class HomeToggleBloc extends Bloc<HomeToggleEvent, HomeToggleState> {
  HomeToggleBloc() : super(const HomeToggleLoaded(0)) {
    on<HomeToggleChanged>((event, emit) {
      emit(HomeToggleLoaded(event.index));
    });
  }
}
