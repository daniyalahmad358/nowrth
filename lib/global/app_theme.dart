import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:nowrth/global/size_config.dart';

abstract class AppTheme {
  static ThemeData customThemeData = ThemeData(
    // primarySwatch: Colors.blue,
    colorScheme: ColorScheme.fromSwatch(),
    // primaryColor: ThemeData.light().primaryColor,
    brightness: ThemeData.light().brightness,
    // appBarTheme: ThemeData.light().appBarTheme,
    textTheme: TextTheme(
      headline2: TextStyle(
        // fontSize: getProportionateScreenHeight(60),
        fontFamily: 'Acme',
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
      headline6: TextStyle(
        fontFamily: 'Acme',
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
  static ThemeData darkThemeData = ThemeData.dark();

  static TextTheme defaultTextTheme(ThemeData baseTheme) {
    TextTheme baseTextTheme = baseTheme.textTheme;
    return baseTextTheme.copyWith(
      headline5: TextStyle(fontFamily: 'Acme', color: baseTheme.primaryColor),
    );
  }

  static TextTheme defaultPrimaryTextTheme(ThemeData baseTheme) {
    TextTheme baseTextTheme = baseTheme.textTheme;
    return baseTextTheme.copyWith(
      headline2: TextStyle(
        fontFamily: 'Acme',
        fontSize: getProportionateScreenHeight(60),
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
      headline6: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: getProportionateScreenHeight(18.3),
      ),
      bodyText1: baseTextTheme.bodyText1!.copyWith(color: Colors.white),
      bodyText2: baseTextTheme.bodyText2!.copyWith(color: Colors.white),
    );
  }

  static ColorScheme defaultColorScheme(ThemeData baseTheme) {
    ColorScheme baseColorScheme = baseTheme.colorScheme;
    return baseColorScheme.copyWith(
      surface: Colors.white,
      background: null,
      onBackground: null,
      secondary: null,
      secondaryVariant: null,
      error: null,
      onError: null,
      onPrimary: null,
      onSecondary: null,
      onSurface: null,
      primary: null,
      primaryVariant: null,
    );
  }

  static AppBarTheme defaultAppBarTheme(ThemeData baseTheme) {
    AppBarTheme baseAppBarTheme = baseTheme.appBarTheme;
    return baseAppBarTheme.copyWith(
      backgroundColor: baseTheme.primaryColor,
      foregroundColor: Colors.white,
      actionsIconTheme: baseTheme.iconTheme.copyWith(color: Colors.white),
      iconTheme: baseTheme.iconTheme.copyWith(
        color: Colors.white,
        size: percentageHeight(4),
      ),
    );
  }

  static IconThemeData defaultPrimaryIconTheme(ThemeData baseTheme) {
    IconThemeData basePrimaryIconTheme = baseTheme.primaryIconTheme;
    return basePrimaryIconTheme.copyWith(
      color: Colors.white,
    );
  }

  static ThemeData defaultTheme(ThemeData baseTheme) {
    return baseTheme.copyWith(
      primaryTextTheme: defaultPrimaryTextTheme(baseTheme),
      textTheme: defaultTextTheme(baseTheme),
      colorScheme: defaultColorScheme(baseTheme),
      appBarTheme: defaultAppBarTheme(baseTheme),
      primaryIconTheme: defaultPrimaryIconTheme(baseTheme),
      primaryColor: baseTheme.primaryColor,
      primaryColorLight: baseTheme.primaryColorLight,
      primaryColorDark: baseTheme.primaryColorDark,
      scaffoldBackgroundColor: Colors.white,
      shadowColor: Colors.grey[400]!.withOpacity(0.56),
    );
  }

  static ThemeData get currentTheme {
    ThemeData base = lightThemeData;
    return defaultTheme(base);
  }
}
