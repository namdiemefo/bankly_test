//@dart=2.9
import 'dart:async';


import 'package:bankly_test/api/models.dart';
import 'package:bankly_test/api/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final Repository repository;

  LoginBloc({this.repository}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is TogglePasswordOn) {
       yield PasswordToggleOn();
    } else if (event is TogglePasswordOff) {
      yield PasswordToggleOff();
    } else if (event is ToggleCheckBoxOn) {
      yield CheckBoxToggledOn();
    } else if (event is ToggleCheckBoxOff) {
      yield CheckBoxToggledOff();
    } else if (event is ButtonClicked) {
      yield* _logUser(event);
  }
}

Stream<LoginState> _logUser(ButtonClicked event) async* {
    LoginUser loginUser = event.user;
    yield ButtonLoading();
    BaseResponse response = await repository.loginUser(loginUser);
    if (response.statuscode == 200) {
      yield ButtonSuccess();
    } else if(response.statuscode == 400) {
      yield ButtonFailure(response.message);
    }

}



}