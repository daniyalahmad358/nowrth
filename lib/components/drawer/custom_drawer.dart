import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:nowrth/constants/app_colors.dart';
import 'package:nowrth/constants/app_pages.dart';
import 'package:nowrth/constants/size_config.dart';

import 'my_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  final AppPage currentPage;
  final List<Widget> menuItems;
  const CustomDrawer({
    Key? key,
    required this.currentPage,
    required this.menuItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: percentageHeight(35),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: kPrimaryColor.withOpacity(0.5),
        ),
        child: Drawer(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: ListView(
                children: <Widget>[
                  MyHeaderDrawer(),
                  CustomDrawerMenu(
                    currentPage: currentPage,
                    menuItems: menuItems,
                  ),
                  // Text("${SizeConfig.screenHeight}")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDrawerMenu extends StatelessWidget {
  final AppPage currentPage;
  final List<Widget> menuItems;

  const CustomDrawerMenu({
    Key? key,
    required this.currentPage,
    required this.menuItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: SizeConfig.screenHeight / 41,
      ),
      child: Column(children: menuItems),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final bool selected;
  final void Function()? onTap;

  const MenuItem({
    Key? key,
    required this.title,
    required this.iconData,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? kPrimaryColor.withOpacity(0.5) : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          if (onTap != null) onTap!();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: percentageHeight(2.44),
            horizontal: percentageWidth(4.35),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Icon(
                  iconData,
                  size: percentageHeight(2.94),
                  // color: Colors.grey[300],
                  color: kPrimaryLightColor,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    // color: Colors.grey[300],
                    color: kPrimaryLightColor,
                    // fontSize: SizeConfig.screenHeight / 42,
                    fontSize: percentageHeight(2.35),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
