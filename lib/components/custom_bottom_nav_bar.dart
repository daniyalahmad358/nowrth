// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../size_config.dart';

import 'package:nowrth/screens/liked/liked_screen.dart';
import 'package:nowrth/screens/home/home_screen.dart';

class CustomBottonNavBar extends StatelessWidget {
  const CustomBottonNavBar({
    Key key,
    this.isAtHome = false,
    this.isAtLiked = false,
  }) : super(key: key);

  final bool isAtHome;
  final bool isAtLiked;

  // Icon homeIcon =
  // isAtLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_outlined);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                icondata: isAtHome
                    ? Icon(Icons.home, color: kPrimaryColor)
                    : Icon(Icons.home_outlined, color: kPrimaryColor),
                title: "Home",
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
                // icon: "assets/icons/calendar.svg",
                icondata: isAtLiked
                    ? Icon(Icons.favorite, color: kPrimaryColor)
                    : Icon(Icons.favorite_border, color: kPrimaryColor),
                title: "Liked",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LikedScreen(),
                    ),
                  );
                },
              ),
              // NavItem(
              //   icon: "assets/icons/chat.svg",
              //   title: "Chat",
              //   isActive: true,
              //   press: () {},
              // ),
              // NavItem(
              //   icon: "assets/icons/friendship.svg",
              //   title: "Friends",
              //   press: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatefulWidget {
  const NavItem({
    Key key,
    @required this.title,
    @required this.press,
    this.icon,
    this.icondata,
    this.isActive = false,
  }) : super(key: key);

  final String icon, title;
  final GestureTapCallback press;
  final bool isActive;
  final icondata;

  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  var iconToBeShown;

  SvgPicture assetIconUsed() {
    var svgpic = SvgPicture.asset(
      widget.icon,
      color: kTextColor,
      height: 28,
    );

    return svgpic;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.icon != null) {
      iconToBeShown = assetIconUsed();
    } else {
      iconToBeShown = widget.icondata;
    }

    return InkWell(
      onTap: widget.press,
      child: Container(
        padding: EdgeInsets.all(5),
        height: getProportionateScreenWidth(60),
        width: getProportionateScreenWidth(60),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (widget.isActive) kDefualtShadow],
        ),
        child: Column(
          children: [
            iconToBeShown,
            // SvgPicture.asset(
            //   icon,
            //   color: kTextColor,
            //   height: 28,
            // ),
            Spacer(),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
