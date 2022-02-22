import 'package:flutter/material.dart';

import 'package:nowrth/global/size_config.dart';

class MyHeaderDrawer extends StatelessWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: percentageHeight(28),
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 10),
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
            style: Theme.of(context).primaryTextTheme.headline6,
          ),
          Text(
            'info@rapidtech.dev',
            style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                  fontSize: percentageHeight(2),
                  fontWeight: FontWeight.w300,
                ),
          ),
        ],
      ),
    );
  }
}
