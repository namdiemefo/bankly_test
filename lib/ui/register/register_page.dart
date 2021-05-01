//@dart=2.9
import 'dart:async';
import 'package:bankly_test/api/models.dart';
import 'package:bankly_test/api/repository.dart';
import 'package:bankly_test/helpers/alert_dialog.dart';
import 'package:bankly_test/helpers/load_dialog.dart';
import 'package:bankly_test/helpers/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/register_bloc.dart';
import 'bloc/register_state.dart';
import 'bloc/register_event.dart';


class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final Repository repository = locator<Repository>();

  final _formKey = GlobalKey<FormState>();

  String _firstName;

  String _lastName;

  String _email;

  String _phoneNumber;

  String _password;

  bool _showPassword = true;

  bool _showPassword1 = true;

  var _showTick = false;

  final TextEditingController _pass = TextEditingController();

  final TextEditingController _confirm = TextEditingController();

  @override
  void dispose() {
    _pass.dispose();
    _confirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF100D3B),
      appBar: AppBar(
        backgroundColor: Color(0xFF100D3B),
      ),

      body: Form(
        key: _formKey,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(30.0, 30.0, 0, 30.0),
                child: Column(
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
                        Text('Register', style: TextStyle(
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
                                child: Text('First name', style: TextStyle(
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
                                    if(value.isEmpty) {
                                      return 'Enter first name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _firstName = value;
                                  },
                                  keyboardType: TextInputType.name,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontFamily: "ProximaNova",
                                  ),
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
                                child: Text('Last name', style: TextStyle(
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
                                    if(value.isEmpty) {
                                      return 'Enter last name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _lastName = value;
                                  },
                                  keyboardType: TextInputType.name,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontFamily: "ProximaNova",
                                  ),
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
                                    if(value.isEmpty) {
                                      return 'Enter a valid email address';
                                    }
                                    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if(!regex.hasMatch(value)) {
                                      return 'Enter a valid email address';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _email = value;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontFamily: "ProximaNova",
                                  ),
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.email, color: Colors.white,),
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
                                child: Text('Phone Number', style: TextStyle(
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
                                  onSaved: (value) {
                                    _phoneNumber = value;
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter a valid phone number';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontFamily: "ProximaNova",
                                  ),
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.phone, color: Colors.white,),
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
                                child: BlocProvider(
                                    create: (context) => RegisterBloc(repository: repository),
                                    child: Builder(
                                      builder: (context) => BlocBuilder<RegisterBloc, RegisterState>(
                                        builder: (context, state) {
                                          if (state is PasswordToggleOn) {
                                            this._showPassword = false;
                                          }
                                          if (state is PasswordToggleOff) {
                                            this._showPassword = true;
                                          }
                                          return TextFormField(
                                            controller: _pass,
                                            validator: (value) {
                                              if(value.isEmpty) {
                                                return 'Enter password';
                                              }
                                              if (value.length < 6) {
                                                return 'Password must contain more than 6 characters ';
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
                                                    this._showPassword == false ? BlocProvider.of<RegisterBloc>(context).add(TogglePasswordOff()) :
                                                    BlocProvider.of<RegisterBloc>(context).add(TogglePasswordOn());
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
                                child: Text('Confirm Password', style: TextStyle(
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
                                child: BlocProvider(
                                    create: (context) => RegisterBloc(repository: repository),
                                    child: Builder(
                                      builder: (context) => BlocBuilder<RegisterBloc, RegisterState>(
                                        builder: (context, state) {
                                          if (state is PasswordToggleOn) {
                                            this._showPassword1 = false;
                                          }
                                          if (state is PasswordToggleOff) {
                                            this._showPassword1 = true;
                                          }
                                          return TextFormField(
                                            validator: (value) {
                                              if(value.isEmpty) {
                                                return 'Re-Enter password';
                                              }

                                              if (value != _pass.text) {
                                                return 'Password does not match';
                                              }

                                              if (_showTick == false) {
                                                return 'Tick box';
                                              }

                                              return null;
                                            },
                                            onSaved: (value) {
                                              //submitConfirmPassword(value);
                                            },
                                            controller: _confirm,
                                            obscureText: this._showPassword1,
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.white
                                            ),
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.lock, color: Colors.white,),
                                                suffixIcon: IconButton(
                                                  icon: Icon(Icons.remove_red_eye, color: this._showPassword1 ? Colors.grey : Colors.blue,),
                                                  onPressed: () {
                                                    this._showPassword1 == false ? BlocProvider.of<RegisterBloc>(context).add(TogglePasswordOff()) :
                                                    BlocProvider.of<RegisterBloc>(context).add(TogglePasswordOn());
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
                                ),
                              )
                            ],
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          BlocProvider(
                              create: (context) => RegisterBloc(repository: repository),
                              child: Builder(
                                builder: (context) => BlocBuilder<RegisterBloc, RegisterState>(
                                  builder: (context, state) {
                                    if (state is CheckBoxToggledOff) {
                                      this._showTick = false;
                                    } else if (state is CheckBoxToggledOn) {
                                      this._showTick = true;
                                    }
                                    return Row(
                                      children: [
                                        Checkbox(
                                          activeColor: Color(0xFF25E0D3),
                                          checkColor: Color(0xFF100D3B),
                                          value: this._showTick,
                                          onChanged: (bool val) {
                                            this._showTick == false ? BlocProvider.of<RegisterBloc>(context).add(ToggleCheckBoxOn()) :
                                            BlocProvider.of<RegisterBloc>(context).add(ToggleCheckBoxOff());
                                          },
                                        ),

                                        Container(
                                            width: MediaQuery.of(context).size.width*0.6,
                                            child: RichText(
                                              text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                        text: 'By pressing Register you accept all ',
                                                        style: TextStyle(color: Colors.white, fontFamily: "ProximaNova")
                                                    ),

                                                    TextSpan(
                                                        text: 'Terms & Conditions',
                                                        style: TextStyle(color: Color(0xFF25E0D3), fontFamily: "ProximaNova"),
                                                        recognizer: TapGestureRecognizer()
                                                          ..onTap = () {
                                                            print('t&c clicked');
                                                          }
                                                    )
                                                  ]
                                              ),
                                            )
                                        )
                                      ],
                                    );
                                  },
                                )
                              )

                          ),


                          SizedBox(
                            height: 20,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*0.83,
                                height: 70,
                                child: BlocProvider(
                                  create: (context) => RegisterBloc(repository: repository),
                                  child: Builder(
                                    builder: (context) => BlocListener<RegisterBloc, RegisterState>(
                                      listenWhen: (prevState, nextState) {
                                        if (prevState is ButtonLoading) {
                                          Load.dismiss(context);
                                        }
                                        return true;
                                      },
                                      listener: (context, state) {
                                           if (state is ButtonFailure) {
                                             String message = state.message;
                                               Alert(icon: Icons.sms_failed, title: message, subtitle: "").show(context);
                                               }

                                           if (state is ButtonLoading) {
                                             Load.show(context);
                                           }
                                           if (state is ButtonSuccess) {
                                             String message = state.message;
                                               Alert(icon: Icons.email, title: message, subtitle: "").show(context);
                                           }

                                      },
                                      child: BlocBuilder<RegisterBloc, RegisterState>(
                                        builder: (context, state) {
                                         return OutlinedButton(
                                             onPressed: () {
                                             if (_formKey.currentState.validate()) {
                                           _formKey.currentState.save();
                                            var user = RegisterUser(firstname: _firstName, lastname: _lastName, email: _email, password: _password, phone: _phoneNumber);
                                            BlocProvider.of<RegisterBloc>(context).add(ButtonClicked(user));
                                      }
                                    },
                                             child: Text('REGISTER')
                                    );
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              )
                            ],
                          )

                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}




