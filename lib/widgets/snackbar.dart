import 'package:flutter/material.dart';

class MyMessageHandler {
  static void showSnackBar(var _scaffoldkey, String message) {
    _scaffoldkey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 255, 43, 43),
        duration: const Duration(seconds: 2),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}
