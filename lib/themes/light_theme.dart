import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    onBackground: Colors.orange,
    background: Colors.orange.shade50,
    primary: Colors.orange.shade100,
    secondary: Colors.orange.shade300,
  ),
);
