import 'package:flutter/widgets.dart';

import 'package:nowrth/global/size_config.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SizedBox(
      width: double.infinity,
      height: SizeConfig.screenHeight,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/login_signup/main_top.png',
              width: SizeConfig.screenWidth * 0.35,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/login_signup/login_bottom.png',
              width: SizeConfig.screenWidth * 0.4,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
