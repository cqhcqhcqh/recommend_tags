import 'package:flutter/material.dart';

const Color primaryColor = Colors.purple;

const TextStyle displayLarge = TextStyle(
  fontFamily: 'Corben',
  fontWeight: FontWeight.w700,
  fontSize: 24,
  color: Colors.black,
);

final appTheme = ThemeData(
  colorSchemeSeed: primaryColor,
  useMaterial3: true,
  textTheme: const TextTheme(
    displayLarge: displayLarge,
  ),
);

