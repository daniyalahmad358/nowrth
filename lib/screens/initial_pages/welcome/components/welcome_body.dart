import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:nowrth/global/size_config.dart';

import 'package:nowrth/screens/initial_pages/components/round_button.dart';

import 'package:nowrth/screens/initial_pages/login/login_screen.dart';
import 'package:nowrth/screens/initial_pages/signup/signup_screen.dart';

import 'background.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LET'S HEAD NOWRTH",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            SvgPicture.asset(
              'assets/icons/chat_people.svg',
              height: SizeConfig.screenHeight * 0.45,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            RoundButton(
              text: 'LOGIN',
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundButton(
              text: 'SIGN UP',
              color: Theme.of(context).primaryColorLight,
              textColor: Theme.of(context).primaryColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
