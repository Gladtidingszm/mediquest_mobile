import 'dart:math';

import 'package:flutter/material.dart';

Color getRandomColor() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}

class GeneralUtils {
  static bool isSuccess(int httpCode) {
    return (httpCode >= 200 && httpCode < 300) ? true : false;
  }

  static TextInputType getKeyBoardType(String questionType) {
    switch (questionType) {
      case "text":
        return TextInputType.text;
        break;
      case "float":
      case "int":
        return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }
}
