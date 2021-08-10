import 'package:flutter/material.dart';
import 'package:nowrth/screens/initial_pages/login/components/background.dart';
import 'package:nowrth/screens/initial_pages/signup/signup_screen.dart';
import 'package:nowrth/components/already_have_an_account_acheck.dart';
import 'package:nowrth/components/rounded_button.dart';
import 'package:nowrth/components/rounded_input_field.dart';
import 'package:nowrth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nowrth/screens/home/home_screen.dart';
import 'package:nowrth/size_config.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: SizeConfig.screenHeight * 0.35,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
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
