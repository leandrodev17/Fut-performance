import 'package:flutter/material.dart';

class InputStyle {
  inputDecoration(String label) {
    return  InputDecoration(
      filled: true,
      fillColor: const Color.fromARGB(255, 61, 61, 61),
      labelText: label,
      labelStyle: const TextStyle(
        color:Colors.orange,
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.orange),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.orange),
      ),
    );
  }
}