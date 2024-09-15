import 'package:flutter/material.dart';

ThemeData mainTheme = ThemeData.from(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0XFF61BFAD),
    primary: Color(0XFF61BFAD),
    secondaryContainer: Color(0XFFF4F3FD),
    secondary: Color(0XFFFF6905),
    onSecondary: Color(0XFFFFEBF0),
    background: Color(0XFFFAFAFA),
  ),
);

ThemeData getTheme(BuildContext context) => Theme.of(context);
TextTheme getTextTheme(BuildContext context) => Theme.of(context).textTheme;
