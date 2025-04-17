

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> flutterToast({required String msg}) {

    return Fluttertoast.showToast(
      
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.black,
      fontSize: 18.0,
    );
  }