import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData customThemeData = ThemeData(
    // primarySwatch: Colors.blue,
    colorScheme: ColorScheme.fromSwatch(),
    // primaryColor: ThemeData.light().primaryColor,
    brightness: ThemeData.light().brightness,
    // appBarTheme: ThemeData.light().appBarTheme,
    textTheme: TextTheme(
      headline2: GoogleFonts.acme(
        // fontSize: getProportionateScreenHeight(60),
        color: Colors.white,
        height: 0.5,
        shadows: [
          Shadow(
            color: Colors.grey[800]!,
            offset: const Offset(5, 5),
            blurRadius: 5,
          )
        ],
      ),
      headline6: GoogleFonts.ubuntu(
        color: Colors.white,
        // fontSize: getProportionateScreenHeight(18),
        shadows: [
          Shadow(
            color: Colors.grey[900]!,
            offset: const Offset(2, 2),
            blurRadius: 2,
          ),
        ],
      ),
      // bodyText1: GoogleFonts.josefinSans(color: kTextColor),
      // bodyText2: GoogleFonts.josefinSans(color: kTextColor),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    bottomNavigationBarTheme: ThemeData.light().bottomNavigationBarTheme,
  );
  static ThemeData lightThemeData = ThemeData.light();
  static ThemeData darktThemeData = ThemeData.dark();

  static TextTheme defaultTextTheme(TextTheme base) {
    return base.copyWith(
      headline2: GoogleFonts.acme(
        // fontSize: getProportionateScreenHeight(60),
        color: Colors.white,
        height: 0.5,
        shadows: [
          Shadow(
            color: Colors.grey[800]!,
            offset: const Offset(5, 5),
            blurRadius: 5,
          )
        ],
      ),
      headline6: GoogleFonts.ubuntu(
        color: Colors.white,
        // fontSize: getProportionateScreenHeight(18),
        shadows: [
          Shadow(
            color: Colors.grey[900]!,
            offset: const Offset(2, 2),
            blurRadius: 2,
          ),
        ],
      ),
    );
  }

  static ThemeData defaultTheme(ThemeData base) {
    return lightThemeData.copyWith(
      textTheme: defaultTextTheme(base.textTheme),
    );
  }

  static ThemeData get currentTheme {
    ThemeData base = lightThemeData;
    return defaultTheme(base);
  }
}
