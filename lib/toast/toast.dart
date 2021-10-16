import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TpToast {
  static void success(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color(0xFFe6fafa),
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }

  static void updated(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color(0xFFfff8ec),
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }

  static void deleted(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color(0xFFfff2f4),
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }

  static void failed(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color(0xFFfff2f4),
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}
