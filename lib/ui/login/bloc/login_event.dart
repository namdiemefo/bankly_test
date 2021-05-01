//@dart=2.9
import 'package:bankly_test/api/models.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class TogglePasswordOn extends LoginEvent {
  TogglePasswordOn();

  @override
  List<Object> get props => [];
}

class TogglePasswordOff extends LoginEvent {
  TogglePasswordOff();

  @override
  List<Object> get props => [];
}

class ToggleCheckBoxOn extends LoginEvent {
  ToggleCheckBoxOn();

  @override
  List<Object> get props => [];
}

class ToggleCheckBoxOff extends LoginEvent {
  ToggleCheckBoxOff();

  @override
  List<Object> get props => [];
}

class ButtonClicked extends LoginEvent {
  final LoginUser user;

  ButtonClicked({this.user});

  @override
  List<Object> get props => [user];
}

class ButtonCorrect extends LoginEvent {
  final LoginUser user;

  ButtonCorrect({this.user});

  @override
  List<Object> get props => [user];
}
