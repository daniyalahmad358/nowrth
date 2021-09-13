import 'package:flutter/material.dart';

import 'package:nowrth/constants/app_colors.dart';
import 'package:nowrth/constants/size_config.dart';

class MyHeaderDrawer extends StatelessWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor.withOpacity(0.5),
      height: SizeConfig.screenHeight * (2 / 7),
      padding: EdgeInsets.only(top: SizeConfig.screenHeight / 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: SizeConfig.screenHeight / 62),
            height: SizeConfig.screenHeight / 9,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile.jpg'),
              ),
            ),
          ),
          Text(
            'Rapid Tech',
            style: TextStyle(
              color: Colors.grey[200],
              // color: kPrimaryLightColor,
              fontSize: SizeConfig.screenHeight / 35,
            ),
          ),
          Text(
            'info@rapidtech.dev',
            style: TextStyle(
              color: Colors.grey[200],
              // color: kPrimaryLightColor,
              fontSize: SizeConfig.screenHeight / 50,
            ),
          ),
        ],
      ),
    );
  }
}
