//@dart=2.9
import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {
  RegisterInitial();

  @override
  List<Object> get props => super.props;
}

class PasswordToggleOn extends RegisterState {
  PasswordToggleOn();

  @override
  List<Object> get props => [];
}

class PasswordToggleOff extends RegisterState {
  PasswordToggleOff();

  @override
  List<Object> get props => [];
}

class CheckBoxToggledOn extends RegisterState {
  CheckBoxToggledOn();

  @override
  List<Object> get props => [];
}

class CheckBoxToggledOff extends RegisterState {
  CheckBoxToggledOff();

  @override
  List<Object> get props => [];
}

class ButtonLoading extends RegisterState {

  ButtonLoading();

  @override
  List<Object> get props => [];
}

class ButtonSuccess extends RegisterState {
  final String message;

  ButtonSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class ButtonFailure extends RegisterState {
  final String message;

  ButtonFailure(this.message);

  @override
  List<Object> get props => [message];
}

