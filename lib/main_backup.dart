import 'package:flutter/material.dart';

import 'package:nowrth/providers/auth.dart';

import 'package:nowrth/global/constants.dart';
import 'package:nowrth/global/app_theme.dart';
import 'package:nowrth/global/all_routes.dart';
import 'package:nowrth/global/size_config.dart';

import 'package:nowrth/screens/home/home_screen.dart';
import 'package:nowrth/screens/initial_pages/welcome/welcome_screen.dart';
import 'package:nowrth/screens/splash/splash_screen.dart';

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
        isAuthentic = await Auth.isAuth;
        return isAuthentic;
      }),
      builder: (ctx, AsyncSnapshot snapshot) => MaterialApp(
        builder: (BuildContext context, Widget? child) {
          SizeConfig().init(context);
          return Theme(data: AppTheme.currentTheme, child: child!);
        },
        debugShowCheckedModeBanner: false,
        routes: allRoutes,
        title: 'Nowrth',
        home: (snapshot.connectionState == ConnectionState.done)
            ? (isAuthentic! && !inTestMode)
                ? const HomeScreen()
                : const WelcomeScreen()
            : const SplashScreen(),
      ),
    );
  }
}
