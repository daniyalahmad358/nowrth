import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nowrth/providers/auth.dart';

import 'package:nowrth/screens/home/components/already_have_an_account_acheck.dart';
import 'package:nowrth/constants/size_config.dart';

import 'package:nowrth/screens/initial_pages/components/rounded_input_field.dart';
import 'package:nowrth/screens/initial_pages/components/rounded_password_field.dart';
import 'package:nowrth/screens/initial_pages/components/round_button.dart';

import 'package:nowrth/screens/initial_pages/login/login_screen.dart';

import 'background.dart';
import 'or_divider.dart';
import 'social_icon.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    SizeConfig().init(context);

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'SIGNUP',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            SvgPicture.asset(
              'assets/icons/signup.svg',
              height: SizeConfig.screenHeight * 0.35,
            ),
            RoundedInputField(
              hintText: 'Your Email',
              controller: emailController,
            ),
            RoundedPasswordField(
              controller: passwordController,
            ),
            RoundButton(
              text: 'SIGNUP',
              press: () {
                Auth().signUp(emailController.text, passwordController.text);
              },
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
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
            const OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: 'assets/icons/facebook.svg',
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: 'assets/icons/twitter.svg',
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: 'assets/icons/google-plus.svg',
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
