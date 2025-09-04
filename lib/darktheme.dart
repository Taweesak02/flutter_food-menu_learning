import 'package:flutter/material.dart';

class Darktheme {
  Color? backgroundColor(bool isdarktheme) {
    return !isdarktheme
        ? Colors.amber[300]
        : const Color.fromARGB(255, 114, 85, 201);
  }

  Color? mainColor(bool isdarktheme) {
    return !isdarktheme ? Colors.white : Colors.blueGrey[900];
  }

  Color? fontColor(bool isdarktheme) {
    return !isdarktheme ? Colors.black : Colors.white;
  }
}
