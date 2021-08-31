import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:nowrth/components/already_have_an_account_acheck.dart';
import 'package:nowrth/constants/size_config.dart';

import 'package:nowrth/screens/initial_pages/components/rounded_input_field.dart';
import 'package:nowrth/screens/initial_pages/components/rounded_password_field.dart';
import 'package:nowrth/screens/initial_pages/components/rounded_button.dart';

import 'package:nowrth/screens/initial_pages/login/login_screen.dart';
import 'package:nowrth/screens/initial_pages/signup/components/background.dart';
import 'package:nowrth/screens/initial_pages/signup/components/or_divider.dart';
import 'package:nowrth/screens/initial_pages/signup/components/social_icon.dart';

class SignupBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: SizeConfig.screenHeight * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
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
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
