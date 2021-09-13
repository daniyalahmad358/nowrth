import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import 'package:nowrth/constants/app_colors.dart';
import 'package:nowrth/providers/auth.dart';

import 'package:nowrth/screens/splash/splash_screen.dart';
import 'package:nowrth/screens/initial_pages/welcome/welcome_screen.dart';
// import 'package:nowrth/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Auth(),
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Nowrth',
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
            textTheme:
                GoogleFonts.poppinsTextTheme().apply(displayColor: kTextColor),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: auth.isAuth
              ? const WelcomeScreen()
              : FutureBuilder(
                  future: auth.tryautoLogin(), // Original
                  // Used to test splash
                  // future: Future.delayed(const Duration(seconds: 2), () {
                  //   auth.tryautoLogin();
                  // }),
                  builder: (ctx, snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? const SplashScreen()
                          : const WelcomeScreen(),
                  // : const HomeScreen(),
                ),
        ),
      ),
    );
  }
}
