import 'package:flutter/material.dart';
import 'package:nowrth/screens/initial_pages/login/login_screen.dart';
import 'package:nowrth/screens/initial_pages/signup/signup_screen.dart';
import 'package:nowrth/screens/initial_pages/welcome/components/background.dart';
import 'package:nowrth/components/rounded_button.dart';
import 'package:nowrth/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nowrth/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO NOWRTH",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            SvgPicture.asset(
              "assets/icons/chat_people.svg",
              height: SizeConfig.screenHeight * 0.45,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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
