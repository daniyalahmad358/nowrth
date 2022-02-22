import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
          ),
        ],
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
//       //   child: Text('Nowrth'),
//       //   style: TextStyle(decorationColor: kPrimaryColor),
//       //   duration: Duration(seconds: 2),
//       // )
//       // ],
//       // ),
//     );
//   }
// }
