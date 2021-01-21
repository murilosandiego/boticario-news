import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  final primaryColor = Color(0xFF010A53);
  final primaryColorDark = Color.fromRGBO(96, 0, 39, 1);
  final primaryColorLight = Color.fromRGBO(188, 71, 123, 1);
  final secondaryColor = Color.fromRGBO(0, 77, 64, 1);
  final secondaryColorDark = Color.fromRGBO(0, 37, 26, 1);
  final disabledColor = Colors.grey[400];
  final dividerColor = Colors.grey;
  final textTheme = TextTheme(
      headline1: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: primaryColorDark,
  ));
  final inputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 16),
    fillColor: Color(0XFFF0F0F0),
    filled: true,
    errorBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(5)),
    alignLabelWithHint: true,
  );
  final buttonTheme = ButtonThemeData(
    colorScheme: ColorScheme.light(primary: primaryColor),
    buttonColor: primaryColor,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  );

  return ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    highlightColor: secondaryColor,
    secondaryHeaderColor: secondaryColorDark,
    disabledColor: disabledColor,
    dividerColor: dividerColor,
    accentColor: primaryColor,
    backgroundColor: Colors.white,
    textTheme: textTheme,
    inputDecorationTheme: inputDecorationTheme,
    buttonTheme: buttonTheme,
  );
}
