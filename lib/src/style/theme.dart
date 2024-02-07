
import 'package:flutter/material.dart';

final theme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 113, 243, 230),
    elevation: 4,
  ),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF0097A7),
    secondary: Color(0xFF009688),
    background: Color(0xFFE0F2F1),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);