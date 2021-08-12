import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nowrth/constants.dart';
import 'package:nowrth/size_config.dart';

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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                icondata: Icon(
                  isAtHome ? Icons.home : Icons.home_outlined,
                  color: kPrimaryColor,
                  size: SizeConfig.screenHeight / 24.6,
                ),
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
                icondata: Icon(
                  isAtLiked ? Icons.favorite : Icons.favorite_border,
                  color: kPrimaryColor,
                  size: SizeConfig.screenHeight / 24.6,
                ),
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
      color: kPrimaryColor,
      height: SizeConfig.screenHeight / 24.6,
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
        height: SizeConfig.screenHeight / (11.18),
        width: getProportionateScreenWidth(55),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (widget.isActive) kDefualtShadow],
        ),
        child: Column(
          children: [
            iconToBeShown,
            Spacer(),
            Text(
              // widget.title,
              "${(SizeConfig.screenWidth).round()},${(SizeConfig.screenHeight).round()}", // TODO
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
