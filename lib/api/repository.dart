import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'models.dart';

abstract class IRepository {
  Future loginUser(LoginUser loginUser);
  Future registerUser(RegisterUser registerUser);
}

class Repository extends IRepository {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.reference().child('Users');

  @override
  Future loginUser(LoginUser loginUser) async {
    _auth.signInWithEmailAndPassword(email: loginUser.email, password: loginUser.password)
        .then((value)  {
      print('id is ${value.user.uid}');
          AuthResult user = value;
          return BaseResponse(statuscode: 200, data: user.user, message: 'Login Successful');
    })
    .catchError((onError) {
      BaseResponse(statuscode: 400, message: '${onError.message}');
    });
  }

  @override
  Future registerUser(RegisterUser registerUser) async {
    _auth.createUserWithEmailAndPassword(email: registerUser.email, password: registerUser.password)
        .then((value) {
      print('id is ${value.user.uid}');
          _database.child(value.user.uid).set({
            'first_name': '${registerUser.firstname}',
            'last_name': '${registerUser.lastname}',
            'email': '${registerUser.email}',
            'password': '${registerUser.password}',
            'number': '${registerUser.phone}'
          }).then((result) {
            print('done');
            return BaseResponse(statuscode: 200, message: 'Successful registration');
          })
            .catchError((onError) {
              return BaseResponse(statuscode: 400, message: '${onError.message}');
          });
      })
      .catchError((onError) {
        return BaseResponse(statuscode: 400, message: '${onError.message}');
      });

  }
  
}