import 'package:flutter/material.dart';
import 'package:nowrth/constants/app_theme_data.dart';
import 'package:nowrth/constants/size_config.dart';
import 'package:nowrth/screens/home/home_screen.dart';

import 'package:provider/provider.dart';

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
    bool? isAuthentic;
    return ChangeNotifierProvider.value(
      value: Auth(),
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Nowrth',
          home: FutureBuilder(
            future: Future.delayed(const Duration(seconds: 3), () async {
              isAuthentic = await auth.isAuth;
              return isAuthentic;
            }),
            builder: (ctx, snapshot) {
              return MediaQuery(
                data: MediaQuery.of(ctx),
                child: Theme(
                  data: AppThemeData(ctx).defaultThemeData,
                  child: (snapshot.connectionState == ConnectionState.done)
                      ? (isAuthentic!)
                          ? const HomeScreen()
                          : const WelcomeScreen()
                      : const SplashScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
