import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowrth/constants/size_config.dart';

import 'app_colors.dart';

class AppThemeData {
  AppThemeData(BuildContext context) {
    SizeConfig().init(context);
  }

  ThemeData get defaultThemeData => ThemeData(
        colorScheme: ColorScheme.light(
          primary: kPrimaryColor,
          primaryVariant: kPrimaryLightColor,
          secondary: kSecondaryColor,
          secondaryVariant: kSecondaryColor,
        ),
        textTheme: TextTheme(
          headline2: GoogleFonts.acme(
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
          headline6: GoogleFonts.ubuntu(
            color: Colors.white,
            fontSize: getProportionateScreenHeight(18),
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
      );
}
