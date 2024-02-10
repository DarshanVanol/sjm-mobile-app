import 'package:flutter/material.dart';
part '_colors_theme_extension.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: smjColorsExtension.primary,

  // textTheme: _textTheme,
  // fontFamily: 'Poppins',
  extensions: [
    smjColorsExtension,
  ],
  // appBarTheme: _appBar,
  // elevatedButtonTheme: _elevatedButton,
  // textButtonTheme: _textButton,
  // outlinedButtonTheme: _outlinedButton,
  // dividerTheme: _divider,
);
