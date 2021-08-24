import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:nowrth/screens/initial_pages/welcome/welcome_screen.dart';
// import 'package:nowrth/constants.dart';
// import 'package:nowrth/size_config.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20.0),
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Center(
                child: Lottie.asset('assets/animations/mountain.json'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: Column(
//       //   children: <Widget>[
//       body: AnimatedSplashScreen(
//         splash: Icon(Icons.travel_explore_outlined),
//         nextScreen: WelcomeScreen(),
//         splashTransition: SplashTransition.rotationTransition,
//         animationDuration: Duration(seconds: 3),
//         splashIconSize: SizeConfig.screenWidth,
//       ),
//       // AnimatedDefaultTextStyle(
//       //   child: Text("Nowrth"),
//       //   style: TextStyle(decorationColor: kPrimaryColor),
//       //   duration: Duration(seconds: 2),
//       // )
//       // ],
//       // ),
//     );
//   }
// }
