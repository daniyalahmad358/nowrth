import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowrth/screens/initial_pages/Login/login_screen.dart';
import 'package:provider/provider.dart';

import 'package:nowrth/constants.dart';
import 'package:nowrth/providers/auth.dart';

import 'package:nowrth/screens/splash/splash_screen.dart';
import 'package:nowrth/screens/initial_pages/Welcome/welcome_screen.dart';
import 'package:nowrth/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
              ? WelcomeScreen()
              : FutureBuilder(
                  future: auth.tryautoLogin(), // Original
                  /*
                  // Used to test splash
                  future: Future.delayed(const Duration(seconds: 5), () {
                    auth.tryautoLogin();
                  }),
                  */
                  builder: (ctx, snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? SplashScreen()
                          : HomeScreen(),
                ),
        ),
      ),
    );
  }
}
