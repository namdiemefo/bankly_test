//@dart=2.9
import 'package:bankly_test/api/models.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class TogglePasswordOn extends RegisterEvent {
  TogglePasswordOn();

  @override
  List<Object> get props => [];
}

class TogglePasswordOff extends RegisterEvent {
  TogglePasswordOff();

  @override
  List<Object> get props => [];
}

class ToggleCheckBoxOn extends RegisterEvent {
  ToggleCheckBoxOn();

  @override
  List<Object> get props => [];
}

class ToggleCheckBoxOff extends RegisterEvent {
  ToggleCheckBoxOff();

  @override
  List<Object> get props => [];
}

class ButtonClicked extends RegisterEvent {
  final RegisterUser registerUser;

  ButtonClicked(this.registerUser);

  @override
  List<Object> get props => [registerUser];
}

class ButtonCorrect extends RegisterEvent {
  final RegisterUser registerUser;
  ButtonCorrect(this.registerUser);

  @override
  List<Object> get props => [registerUser];
}

