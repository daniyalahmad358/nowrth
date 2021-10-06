import 'package:flutter/material.dart';

import 'components/welcome_body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context),
      child: const Scaffold(
        body: WelcomeBody(),
      ),
    );
  }
}
