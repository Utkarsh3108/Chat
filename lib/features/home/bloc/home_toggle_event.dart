abstract class HomeToggleEvent {}

class HomeToggleChanged extends HomeToggleEvent {
  final int index;

  HomeToggleChanged(this.index);
}
