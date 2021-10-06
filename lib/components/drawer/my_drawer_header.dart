import 'package:flutter/material.dart';

import 'package:nowrth/global/size_config.dart';

class MyHeaderDrawer extends StatelessWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: kPrimaryColor.withOpacity(0.5),
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
                image: AssetImage('assets/images/user_dp/dp.jpg'),
              ),
            ),
          ),
          Text(
            'Rapid Tech',
            style: TextStyle(
              fontSize: SizeConfig.screenHeight / 35,
            ),
          ),
          Text(
            'info@rapidtech.dev',
            style: TextStyle(
              fontSize: SizeConfig.screenHeight / 50,
            ),
          ),
        ],
      ),
    );
  }
}
