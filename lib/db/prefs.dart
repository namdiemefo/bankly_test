//@dart=2.9
import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _sharedPreferences;

  init() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
  }

  String get email => _sharedPreferences?.getString(email_key) ?? "";
  String get firstName => _sharedPreferences?.getString(first_name_key) ?? "";
  String get lastName => _sharedPreferences?.getString(last_name_key) ?? "";
  String get number => _sharedPreferences?.getString(num_key) ?? "";

  set email(String value) {
    _sharedPreferences?.setString(email_key, value);
  }

  set firstName(String value) {
    _sharedPreferences?.setString(first_name_key, value);
  }

  set lastName(String value) {
    _sharedPreferences?.setString(last_name_key, value);
  }

  set number(String value) {
    _sharedPreferences?.setString(num_key, value);
  }


  clear() async {
    await _sharedPreferences.clear();
  }

}
const String email_key = "email_key";
const String num_key = "number";
const String first_name_key = "first_name";
const String last_name_key = "last_name";
final sharedPrefs = SharedPrefs();