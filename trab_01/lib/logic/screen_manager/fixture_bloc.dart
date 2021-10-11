import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trab_01/logic/screen_manager/fixture_event.dart';
import 'package:trab_01/logic/screen_manager/fixture_state.dart';

class FixtureBloc extends Bloc<FixtureEvent, FixtureState> {
  FixtureBloc() : super(GenericView());

  @override
  Stream<FixtureState> mapEventToState(FixtureEvent event) async* {
    if (event is ClickOnFixture) {
      yield DeitailedView();
    } else
      yield GenericView();
  }
}
