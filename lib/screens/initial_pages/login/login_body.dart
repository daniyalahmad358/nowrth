import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nowrth/global/constants.dart';

import 'package:nowrth/global/size_config.dart';
import 'package:nowrth/models/enums/app_pages.dart';
import 'package:nowrth/providers/auth.dart';

import 'package:nowrth/screens/initial_pages/components/already_have_an_account_check.dart';

import 'package:nowrth/screens/initial_pages/components/rounded_input_field.dart';
import 'package:nowrth/screens/initial_pages/components/rounded_password_field.dart';
import 'package:nowrth/screens/initial_pages/components/round_button.dart';
import 'package:nowrth/utils/cus_navigator.dart';

import 'components/background.dart';

class LoginBody extends StatelessWidget {
  LoginBody({
    Key? key,
  }) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool loginEnabled = true;

    SizeConfig().init(context);
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'LOGIN',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            SvgPicture.asset(
              'assets/icons/login.svg',
              height: SizeConfig.screenHeight * 0.35,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            StatefulBuilder(builder: (
              BuildContext context,
              void Function(void Function()) setState,
            ) {
              return Column(
                children: <Widget>[
                  RoundedInputField(
                    hintText: 'Email Address',
                    controller: emailController,
                    enabled: loginEnabled,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RoundedPasswordField(
                    controller: passwordController,
                    enabled: loginEnabled,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RoundButton(
                    text: loginEnabled ? 'LOGIN' : '...',
                    color: loginEnabled
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor,
                    textColor: Colors.white,
                    press: loginEnabled
                        ? () async {
                            setState(() {
                              loginEnabled = false;
                            });
                            bool? authorized;
                            try {
                              authorized = await Auth.login(
                                emailController.text,
                                passwordController.text,
                              );
                            } catch (e) {
                              authorized = false;
                            }
                            if (authorized == true || inTestMode) {
                              CusNavigator.pushNamedRemAll(
                                context,
                                AppPage.home.name,
                              );
                            } else {
                              setState(() {
                                loginEnabled = true;
                              });
                            }
                          }
                        : null,
                  ),
                ],
              );
            }),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                CusNavigator.pushNamedRemAll(context, AppPage.signup.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
