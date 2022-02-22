import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:nowrth/global/size_config.dart';
import 'package:nowrth/models/enums/app_pages.dart';

import 'package:nowrth/screens/initial_pages/components/round_button.dart';
import 'package:nowrth/utils/cus_navigator.dart';

import 'components/background.dart';

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
              "Let's head Nowrth",
              style: Theme.of(context).textTheme.headline5,
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
                CusNavigator.pushNamedRemAll(context, AppPage.login.name);
              },
            ),
            RoundButton(
              text: 'SIGN UP',
              color: Theme.of(context).primaryColorLight,
              textColor: Theme.of(context).primaryColor,
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
