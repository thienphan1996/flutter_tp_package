import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TpToast {
  static void success(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color(0xFF00c49a),
      textColor: const Color(0xFFe6fafa),
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
      textColor: const Color(0xFFdd6031),
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
      textColor: const Color(0xFFd81159),
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
      textColor: const Color(0xFFd81159),
      fontSize: 16.0,
    );
  }
}
