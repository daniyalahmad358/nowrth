import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nowrth/constants.dart';
import 'package:nowrth/size_config.dart';

import 'my_drawer_header.dart';

Widget buildDrawer(BuildContext context, var currentPage) {
  SizeConfig().init(context);

  return Container(
    // width: SizeConfig.screenWidth * (3 / 4),
    width: percentageHeight(42.073),
    child: Theme(
      data: Theme.of(context).copyWith(
        canvasColor: kPrimaryColor.withOpacity(0.5),
      ),
      child: Drawer(
        child: Container(
          width: 100,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: ListView(
                children: <Widget>[
                  MyHeaderDrawer(),
                  myDrawerList(context, currentPage),
                  // Text("${SizeConfig.screenHeight}")
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget myDrawerList(BuildContext context, var currentPage) {
  return Container(
    padding: EdgeInsets.only(
      top: SizeConfig.screenHeight / 41,
    ),
    child: Column(
      // shows the list of menu drawer
      children: <Widget>[
        menuItem(context, currentPage, 1, "Dashboard", Icons.dashboard_outlined,
            currentPage == DrawerSections.dashboard ? true : false),
        menuItem(context, currentPage, 2, "Liked", Icons.favorite_border,
            currentPage == DrawerSections.liked ? true : false),
        menuItem(context, currentPage, 3, "Tours", Icons.explore_outlined,
            currentPage == DrawerSections.tours ? true : false),
        Divider(
          color: kPrimaryColor.withOpacity(0.8),
        ),
        menuItem(
          context,
          currentPage,
          4,
          "Settings",
          Icons.settings_outlined,
          currentPage == DrawerSections.settings ? true : false,
        ),
        menuItem(
          context,
          currentPage,
          5,
          "Notifications",
          Icons.notifications_outlined,
          currentPage == DrawerSections.notifications ? true : false,
        ),
        Divider(
          color: kPrimaryColor.withOpacity(0.8),
        ),
        menuItem(
          context,
          currentPage,
          6,
          "About",
          Icons.info_outlined,
          currentPage == DrawerSections.about ? true : false,
        ),
        // Text("${SizeConfig.screenHeight}"),
      ],
    ),
  );
}

Widget menuItem(
  BuildContext context,
  var currentPage,
  int id,
  String title,
  IconData icon,
  bool selected,
) {
  return Material(
    color: selected ? kPrimaryColor.withOpacity(0.5) : Colors.transparent,
    child: InkWell(
      onTap: () {
        Navigator.pop(context);
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
                icon,
                size: SizeConfig.screenHeight / 34,
                color: Colors.grey[300],
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: SizeConfig.screenHeight / 42,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

enum DrawerSections {
  dashboard,
  liked,
  tours,
  settings,
  notifications,
  about,
}
