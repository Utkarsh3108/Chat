abstract class HomeToggleState {
  final int selectedIndex;

  const HomeToggleState(this.selectedIndex);
}

class HomeToggleLoaded extends HomeToggleState {
  const HomeToggleLoaded(int selectedIndex) : super(selectedIndex);
}
