import 'package:flutter/material.dart';
import 'package:nowrth/global/app_shadows.dart';

import 'package:nowrth/global/size_config.dart';

import 'search_field.dart';

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
                style: Theme.of(context).primaryTextTheme.headline2,
              ),
              Text(
                'Travel Community App',
                style: Theme.of(context).primaryTextTheme.headline6!.copyWith(
                  shadows: [homeHeadline6Shadow],
                ),
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
