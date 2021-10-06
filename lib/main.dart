import 'package:flutter/material.dart';

import 'package:nowrth/global/app_theme.dart';
import 'package:nowrth/providers/auth.dart';

import 'package:nowrth/screens/splash/splash_screen.dart';
import 'package:nowrth/screens/initial_pages/welcome/welcome_screen.dart';
import 'package:nowrth/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? isAuthentic;
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3), () async {
        isAuthentic = await Auth().isAuth;
        return isAuthentic;
      }),
      builder: (ctx, AsyncSnapshot snapshot) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nowrth',
        theme: AppTheme.currentTheme,
        home: (snapshot.connectionState == ConnectionState.done)
            ? (isAuthentic!)
                ? const WelcomeScreen()
                : const WelcomeScreen()
            : const SplashScreen(),
      ),
    );
  }
}
