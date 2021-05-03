import 'package:bankly_test/api/models.dart';
import 'package:bankly_test/api/repository.dart';
import 'package:bankly_test/db/prefs.dart';
import 'package:bankly_test/helpers/alert_dialog.dart';
import 'package:bankly_test/helpers/load_dialog.dart';
import 'package:bankly_test/helpers/service_locator.dart';
import 'package:bankly_test/main.dart';
import 'package:bankly_test/ui/pages/carousel.dart';
import 'package:bankly_test/ui/register/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

class LoginPage extends StatelessWidget {

  final Repository repository = locator<Repository>();
  LoginPage();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginBloc(repository: repository) ,
      child: MyLoginPage(),
    );
  }

}

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final _formKey = GlobalKey<FormState>();

  bool _showPassword = true;

  String _email;

  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF100D3B),
        body: Form(
            key: _formKey,
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(30.0, 100.0, 0, 15.0),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Welcome!', style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white
                          ), textAlign: TextAlign.start, ),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Sign in to continue', style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              color: Colors.white
                          ),),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  //padding: EdgeInsets.fromLTRB(40.0, 0, 0, 0),
                                  child: Text('Email', style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal
                                  ),),
                                )
                              ],
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.83,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter email';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontFamily: "ProximaNova",
                                    ),
                                    onSaved: (value) {
                                      _email = value;
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.person, color: Colors.white,),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white)
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white)
                                        ),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red.shade800)
                                        )
                                    ),
                                  ),
                                )
                              ],
                            ),

                            SizedBox(
                              height: 25,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  //padding: EdgeInsets.fromLTRB(40.0, 0, 0, 0),
                                  child: Text('Password', style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal
                                  ),),
                                )
                              ],
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width*0.83,
                                    child: BlocBuilder<LoginBloc, LoginState>(
                                      builder: (context, state) {
                                        if (state is PasswordToggleOn) {
                                          this._showPassword = false;
                                        }
                                        if (state is PasswordToggleOff) {
                                          this._showPassword = true;
                                        }
                                        return TextFormField(
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Enter password';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            _password = value;
                                          },
                                          obscureText: this._showPassword,
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.white
                                          ),
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.lock, color: Colors.white,),
                                              suffixIcon: IconButton(
                                                icon: Icon(Icons.remove_red_eye, color: this._showPassword ? Colors.grey : Colors.blue,),
                                                onPressed: () {
                                                  this._showPassword == false ? BlocProvider.of<LoginBloc>(context).add(TogglePasswordOff()) :
                                                  BlocProvider.of<LoginBloc>(context).add(TogglePasswordOn());
                                                },
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white)
                                              ),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white)
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.red.shade800)
                                              )
                                          ),
                                          cursorColor: Colors.white,

                                        );
                                      },
                                    )
                                )
                              ],
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     TextButton(
                            //         onPressed: () {
                            //           final route = MaterialPageRoute(builder: (context) => ForgotPasswordPage());
                            //           Navigator.push(context, route);
                            //         },
                            //         style: ButtonStyle(
                            //           backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                            //           padding: MaterialStateProperty.all(EdgeInsets.zero),
                            //           tapTargetSize: MaterialTapTargetSize.shrinkWrap
                            //         ),
                            //         child: Text('Forgot Password?', style: TextStyle(
                            //             color: Colors.white, fontSize: 12.0
                            //         ),)
                            //     )
                            //   ],
                            // ),

                            SizedBox(
                              height: 40,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.83,
                                  height: 70,
                                  child: BlocListener<LoginBloc, LoginState>(
                                    listenWhen: (prevState, nextState) {
                                      if (prevState is ButtonLoading) {
                                        Load.dismiss(context);
                                      }
                                      return true;
                                    },
                                    listener: (context, state) {

                                      if (state is ButtonLoading) {
                                        Load.show(context);
                                      }

                                      if (state is ButtonSuccess) {
                                        sharedPrefs.email = 'in';
                                          final route = MaterialPageRoute(builder: (context) => CarouselPage());
                                          Navigator.pushReplacement(context, route);
                                      }

                                      if (state is ButtonFailure) {
                                        String message = state.message;
                                        Alert(icon: Icons.sms_failed, title: message, subtitle: "").show(context);
                                      }
                                    },
                                    child: BlocBuilder<LoginBloc, LoginState>(
                                      builder: (context, state) {
                                        return OutlinedButton(
                                            onPressed: () {
                                              if (_formKey.currentState.validate()) {
                                                _formKey.currentState.save();
                                                var user = LoginUser(email: _email, password: _password);
                                                BlocProvider.of<LoginBloc>(context).add(ButtonClicked(user: user));
                                              }
                                            },
                                            child: Text('SIGN IN')
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            )

                          ],
                        ),
                      ),

                      SizedBox(
                        height: 60,
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    final route = MaterialPageRoute(builder: (context) => RegisterPage());
                                    Navigator.push(context, route);
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap
                                  ),
                                  child: Text('Register here', style: TextStyle(fontSize: 12.0 ,color: Color(0xFF25E0D3)),)
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
        )
    );
  }
}


