import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:nowrth/constants/size_config.dart';
import 'package:nowrth/providers/auth.dart';

import 'package:nowrth/screens/home/components/already_have_an_account_acheck.dart';

import 'package:nowrth/screens/initial_pages/components/rounded_input_field.dart';
import 'package:nowrth/screens/initial_pages/components/rounded_password_field.dart';
import 'package:nowrth/screens/initial_pages/components/round_button.dart';
import 'package:nowrth/screens/initial_pages/signup/signup_screen.dart';
import 'package:nowrth/screens/home/home_screen.dart';

import 'background.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    SizeConfig().init(context);

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'LOGIN',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            SvgPicture.asset(
              'assets/icons/login.svg',
              height: SizeConfig.screenHeight * 0.35,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            RoundedInputField(
              hintText: 'Your Email',
              controller: emailController,
            ),
            RoundedPasswordField(
              controller: passwordController,
            ),
            RoundButton(
              text: 'LOGIN',
              press: () {
                Auth().login(emailController.text, passwordController.text);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            AlreadyHaveAnAccountCheck(
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
