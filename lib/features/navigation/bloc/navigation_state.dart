abstract class NavigationState {
  final int currentIndex;

  const NavigationState(this.currentIndex);
}

class NavigationLoaded extends NavigationState {
  const NavigationLoaded(int currentIndex) : super(currentIndex);

  NavigationLoaded copyWith({int? currentIndex}) {
    return NavigationLoaded(currentIndex ?? this.currentIndex);
  }
}
