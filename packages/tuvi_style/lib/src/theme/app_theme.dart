import 'package:flutter/material.dart';

import 'color_schemes.dart';

class AppTheme {
  static const primaryColor = Color.fromARGB(255, 3, 155, 229);
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        // titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyMedium: TextStyle(fontSize: 14.0),
      ),
    );
    // return ThemeData(
    //     brightness: Brightness.light,
    //     primarySwatch:
    //         MaterialColor(primaryColor.value, getSwatch(primaryColor)),
    //     backgroundColor: const Color.fromARGB(255, 243, 243, 243));
  }

  static ThemeData dark() {
    return ThemeData(useMaterial3: true, colorScheme: darkColorScheme);
    // return ThemeData(
    //     brightness: Brightness.dark,
    //     primarySwatch:
    //         MaterialColor(primaryColor.value, getSwatch(primaryColor)),
    //     backgroundColor: backgroundBlack);
  }

  static const backgroundBlack = Colors.black54;
  static const backgroundBlue = Color.fromARGB(255, 0, 86, 156);
  static const backgroundGrey = Colors.blueGrey;
  static const textWhite = Colors.white;
}
