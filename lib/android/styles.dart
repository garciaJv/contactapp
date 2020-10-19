import 'package:contactapp/shared/styles.dart';
import 'package:flutter/material.dart';

const brightness = Brightness.dark;
const primaryColor = basePrimaryColor;
const accentColor = baseAccentColor;

ThemeData androidTheme() {
  return ThemeData(
    brightness: brightness,
    textTheme: new TextTheme(
      bodyText1: new TextStyle(
        fontFamily: "Poppins",
      ),
      bodyText2: TextStyle(
        fontFamily: "Poppins",
      ),
      button: TextStyle(
        fontFamily: "Poppins",
      ),
      caption: TextStyle(
        fontFamily: "Poppins",
      ),
      headline1: TextStyle(
        fontFamily: "Poppins",
      ),
      headline2: TextStyle(
        fontFamily: "Poppins",
      ),
      headline3: TextStyle(
        fontFamily: "Poppins",
      ),
      headline4: TextStyle(
        fontFamily: "Poppins",
      ),
      headline5: TextStyle(
        fontFamily: "Poppins",
      ),
      overline: TextStyle(
        fontFamily: "Poppins",
      ),
      subtitle1: TextStyle(
        fontFamily: "Poppins",
      ),
      subtitle2: TextStyle(
        fontFamily: "Poppins",
      ),
      headline6: TextStyle(
        fontFamily: "Poppins",
      ),
    ),
    primaryColor: primaryColor,
    accentColor: accentColor,
  );
}
