abstract class FixtureEvent {}

class ClickOnFixture extends FixtureEvent {
  int? fixtureIndex;

  ClickOnFixture({this.fixtureIndex});
}
