//@dart=2.9
import 'dart:async';
import 'package:bankly_test/api/models.dart';
import 'package:bankly_test/api/repository.dart';
import 'package:bankly_test/ui/register/bloc/register_event.dart';
import 'package:bankly_test/ui/register/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  final Repository repository;

  RegisterBloc({this.repository}) : assert(repository != null), super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is TogglePasswordOn) {
      yield PasswordToggleOn();
    } else if (event is TogglePasswordOff) {
      yield PasswordToggleOff();
    } else if (event is ToggleCheckBoxOn) {
      yield CheckBoxToggledOn();
    } else if (event is ToggleCheckBoxOff) {
      yield CheckBoxToggledOff();
    } else if (event is ButtonClicked) {
     yield* _registerUser(event);
    }
  }

  Stream<RegisterState> _registerUser(ButtonClicked event) async* {
    RegisterUser registerUser = event.registerUser;
    yield ButtonLoading();
    BaseResponse response = await repository.registerUser(registerUser);
    if (response.statuscode == 200) {
      yield ButtonSuccess(response.message);
    } else if (response.statuscode == 400) {
      yield ButtonFailure(response.message);
    }
  }


}