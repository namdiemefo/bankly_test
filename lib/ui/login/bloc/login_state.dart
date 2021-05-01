//@dart=2.9
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  LoginInitial();

  @override
  List<Object> get props => [];
}

class PasswordToggleOn extends LoginState {
  PasswordToggleOn();

  @override
  List<Object> get props => [];
}

class PasswordToggleOff extends LoginState {
  PasswordToggleOff();

  @override
  List<Object> get props => [];
}

class CheckBoxToggledOn extends LoginState {
  CheckBoxToggledOn();

  @override
  List<Object> get props => [];
}

class CheckBoxToggledOff extends LoginState {
  CheckBoxToggledOff();

  @override
  List<Object> get props => [];
}

class ButtonLoading extends LoginState {

  ButtonLoading();

  @override
  List<Object> get props => [];
}

class ButtonSuccess extends LoginState {
  ButtonSuccess();

  @override
  List<Object> get props => [];
}

class ButtonFailure extends LoginState {
  final String message;

  ButtonFailure(this.message);

  @override
  List<Object> get props => [message];
}

