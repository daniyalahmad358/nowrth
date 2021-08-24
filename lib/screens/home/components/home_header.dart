import 'package:flutter/material.dart';

import 'package:nowrth/size_config.dart';
import 'search_fields.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenWidth(20.83)),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/home_bg.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: getProportionateScreenHeight(237.7),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: getProportionateScreenHeight(60.4)),
              Text(
                "Nowrth",
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(60.83),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 0.5),
              ),
              Text(
                "Travel Community App",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Positioned(
            bottom: getProportionateScreenWidth(-20.83),
            child: SearchField(),
          )
        ],
      ),
    );
  }
}
