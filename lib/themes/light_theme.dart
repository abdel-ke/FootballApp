import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.black,
  ),
  colorScheme: ColorScheme.light(
    background: Colors.orange.shade50,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
  ),
);
