import 'dart:async';
import 'package:bloc/bloc.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState(null));
  // UserState _userState = UserState();

  // StreamController<UserEvent> _input = StreamController();
  // StreamController<String> _output = StreamController();

  // StreamSink<UserEvent> get sendEvent => _input.sink;
  // Stream<String> get userStream => _output.stream;

  // UserBloc() {
  //   _input.stream.listen(_onEvent);
  // }

  // void _onEvent(UserEvent event) {
  //   if (event is OnChangeEvent) {
  //     _userState.onChange(event.value);
  //   }

  //   _output.add(_userState.username);
  // }

  // void dispose() {
  //   _input.close();
  //   _output.close();
  // }

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is OnChangeEvent) {
      state.onChange(event.value);
    }
  }
}
