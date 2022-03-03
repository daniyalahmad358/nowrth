import 'package:flutter/material.dart';
import 'package:nowrth/models/enums/app_pages.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:nowrth/providers/auth.dart';

import 'package:nowrth/screens/home/components/already_have_an_account_check.dart';
import 'package:nowrth/global/size_config.dart';

import 'package:nowrth/screens/initial_pages/components/rounded_input_field.dart';
import 'package:nowrth/screens/initial_pages/components/rounded_password_field.dart';
import 'package:nowrth/screens/initial_pages/components/round_button.dart';

import 'package:nowrth/utils/cus_navigator.dart';
import 'package:nowrth/utils/validate_text.dart';

import 'components/background.dart';
import 'components/or_divider.dart';
import 'components/social_icon.dart';

class SignupBody extends StatelessWidget {
  SignupBody({Key? key}) : super(key: key);
  final TextEditingController firstNameCtrl = TextEditingController();
  final TextEditingController lastNameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController confirmPasswordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool signupEnabled = true;
    bool? firstNameIsValid;
    bool? lastNameIsValid;
    bool? emailIsValid;
    PasswordStatus? passwordStatus;
    bool? passwordsMatch;

    SizeConfig().init(context);

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Join Nowrth',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            /*
              // SvgPicture.asset(
              //   'assets/icons/signup.svg',
              //   height: SizeConfig.screenHeight * 0.35,
              // ),
            */
            StatefulBuilder(builder: (context, setState) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            width: percentageWidth(42),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(29),
                                right: Radius.circular(5),
                              ),
                              border: Border.all(
                                color: Theme.of(context).dividerColor,
                              ),
                            ),
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: 'First Name',
                                border: InputBorder.none,
                              ),
                              controller: firstNameCtrl,
                              enabled: signupEnabled,
                            ),
                          ),
                          if (firstNameIsValid == false)
                            SizedBox(
                              width: percentageWidth(27),
                              child: Text(
                                'Invalid first name',
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: Colors.red,
                                      fontSize: percentageHeight(1.85),
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(width: percentageWidth(2)),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            width: percentageWidth(41),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(29),
                                left: Radius.circular(5),
                              ),
                              border: Border.all(
                                color: Theme.of(context).dividerColor,
                              ),
                            ),
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: 'Last Name',
                                border: InputBorder.none,
                              ),
                              controller: lastNameCtrl,
                              enabled: signupEnabled,
                            ),
                          ),
                          if (lastNameIsValid == false)
                            SizedBox(
                              width: percentageWidth(36),
                              child: Text(
                                'Invalid Last Name',
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: Colors.red,
                                      fontSize: percentageHeight(1.85),
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RoundedInputField(
                    hintText: 'Email Address',
                    controller: emailCtrl,
                    enabled: signupEnabled,
                  ),
                  if (emailIsValid == false)
                    SizedBox(
                      width: percentageWidth(68),
                      child: Text(
                        'Invalid email address',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.red,
                              fontSize: percentageHeight(1.85),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  RoundedPasswordField(
                    controller: passwordCtrl,
                    enabled: signupEnabled,
                  ),
                  if (passwordStatus != null &&
                      validationError(passwordStatus) != null)
                    SizedBox(
                      width: percentageWidth(68),
                      child: Text(
                        validationError(passwordStatus)!,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.red,
                              fontSize: percentageHeight(1.85),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  RoundedPasswordField(
                    controller: confirmPasswordCtrl,
                    enabled: signupEnabled,
                    hintText: 'Confirm Password',
                  ),
                  if (passwordsMatch == false)
                    SizedBox(
                      width: percentageWidth(68),
                      child: Text(
                        'Passwords do not match',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.red,
                              fontSize: percentageHeight(1.85),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  RoundButton(
                    text: signupEnabled ? 'SIGNUP' : '...',
                    color: signupEnabled
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor,
                    textColor: Colors.white,
                    press: signupEnabled
                        ? () async {
                            setState(() {
                              signupEnabled = false;
                              firstNameIsValid = ValidateText.firstName(
                                firstNameCtrl.text,
                              );
                              lastNameIsValid = ValidateText.lastName(
                                lastNameCtrl.text,
                              );
                              emailIsValid = ValidateText.email(emailCtrl.text);
                              passwordStatus = ValidateText.password(
                                passwordCtrl.text,
                              );
                              passwordsMatch = ValidateText.confirmPassword(
                                passwordCtrl.text,
                                confirmPasswordCtrl.text,
                              );
                            });

                            bool allValidated = (firstNameIsValid == true) &&
                                (lastNameIsValid == true) &&
                                (emailIsValid == true) &&
                                (passwordStatus == PasswordStatus.valid) &&
                                (passwordsMatch == true);

                            bool? registered = (allValidated)
                                ? await Auth.signUp(
                                    firstName: firstNameCtrl.text,
                                    lastName: lastNameCtrl.text,
                                    email: emailCtrl.text,
                                    password: passwordCtrl.text,
                                  )
                                : false;

                            if (registered == true || allValidated) {
                              CusNavigator.pushNamedRemAll(
                                context,
                                AppPage.home.name,
                              );
                            } else {
                              setState(() {
                                signupEnabled = true;
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
              login: false,
              press: () {
                CusNavigator.pushNamedRemAll(context, AppPage.login.name);
              },
            ),
            const OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: 'assets/icons/facebook.svg',
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: 'assets/icons/twitter.svg',
                  press: () {},
                ),
                SocialIcon(
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
