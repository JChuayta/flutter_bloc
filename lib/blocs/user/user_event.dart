part of 'user_bloc.dart';

abstract class UserEvent {}

class OnChangeEvent extends UserEvent {
  final String value;

  OnChangeEvent(this.value);
}

class GetUsernameEvent extends UserEvent {}
