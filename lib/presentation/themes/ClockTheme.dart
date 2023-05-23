import 'package:flutter/material.dart';

class ClockTheme extends ColorScheme {
  const ClockTheme()
      : super(
            background: Colors.white,
            surface: Colors.white,
            brightness: Brightness.light,
            secondary: Colors.green,
            tertiary: Colors.yellow,
            primary: Colors.red,
            onBackground: Colors.black,
            error: Colors.redAccent,
            onError: Colors.black,
            onPrimary: Colors.black,
            onSurface: Colors.black,
            onSecondary: Colors.black);

  const ClockTheme.dark()
      : super.dark(
            background: Colors.black,
            surface: Colors.black,
            brightness: Brightness.dark,
            secondary: Colors.green,
            tertiary: Colors.yellow,
            primary: Colors.red,
            onBackground: Colors.white,
            error: Colors.redAccent,
            onError: Colors.black,
            onPrimary: Colors.black,
            onSurface: Colors.black,
            onSecondary: Colors.black);
}

extension ClockThemeExt on ColorScheme {
  Color get minuteColor {
    if (brightness == Brightness.dark) {
      return Colors.white;
    }
    return Colors.black;
  }

  Color get hourColor {
    if (brightness == Brightness.dark) {
      return Colors.red;
    }
    return Colors.red;
  }

  Color get ringColor {
    if (brightness == Brightness.dark) {
      return Colors.white;
    }
    return Colors.black;
  }

  Color get cover {
    if (brightness == Brightness.dark) {
      return Colors.white;
    }
    return Colors.grey.shade100;
  }
}
