import 'package:flutter/widgets.dart';

import 'package:nowrth/constants/size_config.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight,
      // Here i can use SizeConfig.screenWidth but use double.infinity because both work as a same
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/login_signup/signup_top.png",
              width: SizeConfig.screenWidth * 0.35,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/login_signup/main_bottom.png",
              width: SizeConfig.screenWidth * 0.25,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: percentageHeight(10)),
            alignment: Alignment.topCenter,
            child: child,
          ),
        ],
      ),
    );
  }
}
