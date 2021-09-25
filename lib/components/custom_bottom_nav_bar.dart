import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nowrth/constants/app_colors.dart';
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
    Color colorWithOpacity = kPrimaryColor.withOpacity(0.5);

    SizeConfig().init(context);
    return SafeArea(
      child: Container(
        width: percentageWidth(10),
        decoration: BoxDecoration(
          color: colorWithOpacity,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(kDefaultPadding),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                NavItem(
                  icon: Icon(
                    isAtHome ? Icons.home : Icons.home_outlined,
                    color: kSecondaryColor,
                    size: SizeConfig.screenHeight / 24.6,
                  ),
                  title: 'Home',
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),
                NavItem(
                  icon: Icon(
                    isAtLiked ? Icons.favorite : Icons.favorite_border,
                    color: kSecondaryColor,
                    size: SizeConfig.screenHeight / 24.6,
                  ),
                  title: 'Liked',
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LikedScreen(),
                      ),
                    );
                  },
                ),
              ],
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
  final Icon? icon;

  const NavItem({
    Key? key,
    required this.title,
    required this.press,
    this.svgIconPath,
    this.icon,
    this.isActive = false,
  }) : super(key: key);

  SvgPicture assetIconUsed() {
    var svgpic = SvgPicture.asset(
      svgIconPath!,
      color: kSecondaryColor,
      height: SizeConfig.screenHeight / 24.6,
    );
    return svgpic;
  }

  @override
  Widget build(BuildContext context) {
    Widget? iconToBeShown;

    if (svgIconPath != null) {
      iconToBeShown = assetIconUsed();
    } else {
      iconToBeShown = icon;
    }

    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(5),
        height: percentageHeight(9),
        width: getProportionateScreenWidth(55),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[
            iconToBeShown!,
            const Spacer(),
            Text(
              title,
              // '${(SizeConfig.screenWidth).round()},${(SizeConfig.screenHeight).round()}', // TODO: show page title instead of page size
              style: TextStyle(
                fontSize: SizeConfig.screenHeight / 55.91,
                fontWeight: FontWeight.bold,
                color: kSecondaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final bool isAtHome;
  final bool isAtLiked;
  const CustomBottomNavBar({
    Key? key,
    this.isAtHome = false,
    this.isAtLiked = false,
  }) : super(key: key);

  @override
  BottomNavigationBar build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: (isAtHome) ? 0 : 1,
      backgroundColor: Theme.of(context).primaryColorLight,
      items: const [
        BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: 'Liked', icon: Icon(Icons.favorite)),
      ],
    );
  }
}
