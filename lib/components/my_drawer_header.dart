import 'package:flutter/material.dart';
import 'package:nowrth/constants.dart';
import 'package:nowrth/size_config.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor.withOpacity(0.5),
      height: SizeConfig.screenHeight * (2 / 7),
      padding: EdgeInsets.only(top: SizeConfig.screenHeight / 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: SizeConfig.screenHeight / 62),
            height: SizeConfig.screenHeight / 9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile.jpg'),
              ),
            ),
          ),
          Text(
            "Rapid Tech",
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.screenHeight / 35,
            ),
          ),
          Text(
            "info@rapidtech.dev",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: SizeConfig.screenHeight / 50,
            ),
          ),
        ],
      ),
    );
  }
}
