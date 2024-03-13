import 'package:flutter/material.dart';

const colorGreen = Colors.green;
const colorIndigo = Colors.indigo;
const colorLightGreen = Colors.lightGreen;
final colorGrey100 = Colors.grey[100];
const colorIndigoAccent = Colors.indigoAccent;
final colorGrey900 = Colors.grey[900];
const colorWhite = Colors.white;
const colorBlack = Colors.black;

const textTheme = TextTheme(
  bodyLarge: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
  ),
  bodyMedium: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
  ),
  bodySmall: TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 11,
  ),
);

final lightTheme = ThemeData(
  textTheme: textTheme,
  useMaterial3: true,
  scaffoldBackgroundColor: colorGrey100,
  colorScheme: ColorScheme.fromSeed(
    background: colorGrey100,
    primary: colorGreen,
    secondary: colorLightGreen,
    seedColor: colorGreen,
    brightness: Brightness.light,
  ),
);

final darkTheme = ThemeData(
  textTheme: textTheme,
  useMaterial3: true,
  scaffoldBackgroundColor: colorGrey900,
  colorScheme: ColorScheme.fromSeed(
    background: colorGrey900,
    primary: colorIndigo,
    secondary: colorIndigoAccent,
    seedColor: colorIndigo,
    brightness: Brightness.dark,
  ),
);
