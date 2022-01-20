import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = Color(0xff5AAF62);
  static Color hintColor = Color(0xff767C86);
  static Color dividerColor = Color(0xff8A909C);
  static Color lightColor = Colors.white;
  static Color darkColor = Color(0xff132033);
  static Color disabledColor = Color(0xff9BA1AB);

  /// dark theme data
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'poppins',
    scaffoldBackgroundColor: Color(0xff132033),
    primaryColor: primaryColor,
    cardColor: Color(0xff1E293B),
    hintColor: hintColor,
    dividerColor: dividerColor,
    disabledColor: disabledColor,
    accentColor: lightColor,
    toggleableActiveColor: primaryColor,

    /// appBar theme
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      textTheme: TextTheme(
        headline6: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),

    /// text theme
    textTheme: TextTheme(
      button: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
        fontSize: 12,
        color: lightColor,
      ),
      subtitle1: TextStyle(color: lightColor, fontWeight: FontWeight.w600),
      subtitle2: TextStyle(color: lightColor),
      headline1: TextStyle(color: lightColor),
      headline2: TextStyle(color: lightColor),
      headline3: TextStyle(color: lightColor),
      headline4: TextStyle(color: lightColor),
      headline5: TextStyle(color: lightColor, fontWeight: FontWeight.bold),
      headline6: TextStyle(color: lightColor),
      bodyText1: TextStyle(color: lightColor),
      bodyText2: TextStyle(color: lightColor),
      caption: TextStyle(color: dividerColor),
      overline: TextStyle(
        color: dividerColor,
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  /// light theme data
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'poppins',
    primaryColor: primaryColor,
    hintColor: hintColor.withAlpha(200),
    cardColor: lightColor,
    disabledColor: disabledColor,
    dividerColor: dividerColor.withAlpha(120),
    accentColor: Color(0xff132033),
    toggleableActiveColor: primaryColor,

    /// appBar theme
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      iconTheme: IconThemeData(color: darkColor),
      textTheme: TextTheme(
        headline6: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: darkColor,
        ),
      ),
    ),

    ///text theme
    textTheme: TextTheme(
      button: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
        fontSize: 12,
      ),
      subtitle1: TextStyle(fontWeight: FontWeight.w600),
      subtitle2: TextStyle(),
      headline1: TextStyle(),
      headline2: TextStyle(),
      headline3: TextStyle(),
      headline4: TextStyle(),
      headline5: TextStyle(fontWeight: FontWeight.bold),
      headline6: TextStyle(),
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
      caption: TextStyle(color: dividerColor),
      overline: TextStyle(
        color: dividerColor,
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
