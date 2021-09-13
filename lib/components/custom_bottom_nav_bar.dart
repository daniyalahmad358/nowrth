import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nowrth/constants/app_colors.dart';
import 'package:nowrth/constants/app_shadows.dart';
import 'package:nowrth/constants/app_paddings.dart';
import 'package:nowrth/constants/size_config.dart';

import 'package:nowrth/screens/liked/liked_screen.dart';
import 'package:nowrth/screens/home/home_screen.dart';

class CustomBottonNavBar extends StatelessWidget {
  const CustomBottonNavBar({
    Key? key,
    this.isAtHome = false,
    this.isAtLiked = false,
  }) : super(key: key);

  final bool isAtHome;
  final bool isAtLiked;

  @override
  Widget build(BuildContext context) {
    Color colorWithOpacity = kPrimaryLightColor.withOpacity(0.9);

    SizeConfig().init(context);
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: colorWithOpacity,
          boxShadow: [kBottomNavBarShadow],
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(kDefaultPadding),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  NavItem(
                    icondata: Icon(
                      isAtHome ? Icons.home : Icons.home_outlined,
                      color: kPrimaryColor,
                      size: SizeConfig.screenHeight / 24.6,
                    ),
                    title: 'Home',
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                  ),
                  NavItem(
                    icondata: Icon(
                      isAtLiked ? Icons.favorite : Icons.favorite_border,
                      color: kPrimaryColor,
                      size: SizeConfig.screenHeight / 24.6,
                    ),
                    title: 'Liked',
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LikedScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String? svgIconPath;
  final String title;
  final GestureTapCallback press;
  final bool isActive;
  final Icon? icondata;

  NavItem({
    Key? key,
    required this.title,
    required this.press,
    this.svgIconPath,
    this.icondata,
    this.isActive = false,
  }) : super(key: key);

  SvgPicture assetIconUsed() {
    var svgpic = SvgPicture.asset(
      svgIconPath!,
      color: kPrimaryColor,
      height: SizeConfig.screenHeight / 24.6,
    );
    return svgpic;
  }

  @override
  Widget build(BuildContext context) {
    var iconToBeShown;

    if (svgIconPath != null) {
      iconToBeShown = assetIconUsed();
    } else {
      iconToBeShown = icondata;
    }

    return InkWell(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(5),
        height: percentageHeight(9),
        width: getProportionateScreenWidth(55),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isActive) kDefualtShadow],
        ),
        child: Column(
          children: <Widget>[
            iconToBeShown,
            Spacer(),
            Text(
              title,
              // '${(SizeConfig.screenWidth).round()},${(SizeConfig.screenHeight).round()}', // TODO: show page title instead of page size
              style: TextStyle(
                fontSize: SizeConfig.screenHeight / 55.91,
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
