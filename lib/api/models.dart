class LoginUser {
  String _email;
  String _password;

  String get email => _email;
  String get password => _password;

  LoginUser({
    String email,
    String password}){
    _email = email;
    _password = password;
  }

  LoginUser.fromJson(dynamic json) {
    _email = json["email"];
    _password = json["password"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["email"] = _email;
    map["password"] = _password;
    return map;
  }

}

class RegisterUser {
  String _firstname;
  String _lastname;
  String _email;
  String _password;
  String _phone;

  String get firstname => _firstname;
  String get lastname => _lastname;
  String get email => _email;
  String get password => _password;
  String get phone => _phone;

  RegisterUser({
    String firstname,
    String lastname,
    String email,
    String password,
    String phone}){
    _firstname = firstname;
    _lastname = lastname;
    _email = email;
    _password = password;
    _phone = phone;
  }

  RegisterUser.fromJson(dynamic json) {
    _firstname = json["firstname"];
    _lastname = json["lastname"];
    _email = json["email"];
    _password = json["password"];
    _phone = json["phone"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["firstname"] = _firstname;
    map["lastname"] = _lastname;
    map["email"] = _email;
    map["password"] = _password;
    map["phone"] = _phone;
    return map;
  }

}

//@dart=2.9
class BaseResponse<T> {
  int _statuscode;
  T _data;
  String _message;

  int get statuscode => _statuscode;
  T get data => _data;
  String get message => _message;

  BaseResponse({
    int statuscode,
    T data,
    String message}){
    _statuscode = statuscode;
    data = data;
    _message = message;
  }

  BaseResponse.fromJson(dynamic json) {
    _statuscode = json["statuscode"];
    _data = json["data"];
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["statuscode"] = _statuscode;
    if (_data != null) {
       map["data"] = (T as BaseResponse).toJson();
     }
    map["message"] = _message;
    return map;
  }

// Map<String, dynamic> toJson() {
//   var map = <String, dynamic>{};
//   return map;
// }
}