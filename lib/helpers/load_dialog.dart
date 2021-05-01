//@dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Load{

  static void show(BuildContext context) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => Center(
          child: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CupertinoActivityIndicator(),
            ),
          ),
        ),
      );

  }

  static void dismiss(BuildContext context) {
        Navigator.of(context, rootNavigator: true).pop();
  }

}