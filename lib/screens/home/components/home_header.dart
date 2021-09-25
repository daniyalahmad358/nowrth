import 'package:flutter/material.dart';

import 'package:nowrth/constants/size_config.dart';

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
            'assets/images/app_images/home_banner.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: getProportionateScreenHeight(237.7),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: getProportionateScreenHeight(60.4)),
              Text(
                'Nowrth',
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                'Travel Community App',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          Positioned(
            bottom: getProportionateScreenWidth(-20.83),
            child: const SearchField(),
          )
        ],
      ),
    );
  }
}
