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
  CollectionReference collectionReference = Firestore.instance.collection('user');

  final DatabaseReference _database = FirebaseDatabase.instance.reference().child('Users');

  @override
  Future loginUser(LoginUser loginUser) async =>
      _auth.signInWithEmailAndPassword(email: loginUser.email, password: loginUser.password)
        .then((value)  {
          print('id is ${value.user.uid}');
          AuthResult user = value;
          return BaseResponse(statuscode: 200, data: user.user, message: 'Login Successful');
    })
      .onError((error, stackTrace) => BaseResponse(statuscode: 400, message: '${error.message}') );

  @override
  Future<BaseResponse> registerUser(RegisterUser registerUser) async =>

      _auth.createUserWithEmailAndPassword(email: registerUser.email, password: registerUser.password)
        .then((value) {
            print('id is ${value.user.uid}');
            collectionReference.add({
            'first_name': '${registerUser.firstname}',
            'last_name': '${registerUser.lastname}',
            'email': '${registerUser.email}',
            'password': '${registerUser.password}',
            'number': '${registerUser.phone}'
          }).then((result) {
            print('done');

          })
            .catchError((onError) {
            print('error is ${onError.message}');
             // return BaseResponse(statuscode: 400, message: '${onError.message}');
          });
            return BaseResponse(statuscode: 200, message: 'Successful registration');
      })
      .catchError((onError) =>
       //print('my error is ${onError}')
      BaseResponse(statuscode: 400, message: '${onError.message}')

      );
  
}