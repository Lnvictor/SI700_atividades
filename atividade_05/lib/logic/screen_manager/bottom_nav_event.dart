abstract class BottomNavigationEvent {}

class ClickOnItem extends BottomNavigationEvent {
  int? index;

  ClickOnItem({this.index});
}
