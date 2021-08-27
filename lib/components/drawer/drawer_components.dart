import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nowrth/constants.dart';
import 'package:nowrth/size_config.dart';

import 'my_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  final DrawerSections currentPage;
  const CustomDrawer({Key? key, required this.currentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
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
                    DrawerList(currentPage: currentPage),
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
}

class DrawerList extends StatelessWidget {
  final DrawerSections currentPage;
  const DrawerList({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: SizeConfig.screenHeight / 41,
      ),
      child: Column(
        // shows the list of menu drawer
        children: <Widget>[
          MenuItem(
            currentPage: currentPage,
            id: 1,
            title: "Dashboard",
            iconData: Icons.dashboard_outlined,
            selected: currentPage == DrawerSections.dashboard ? true : false,
          ),
          MenuItem(
            currentPage: currentPage,
            id: 2,
            title: "Liked",
            iconData: Icons.favorite_border,
            selected: currentPage == DrawerSections.liked ? true : false,
          ),
          MenuItem(
            currentPage: currentPage,
            id: 3,
            title: "Tours",
            iconData: Icons.explore_outlined,
            selected: currentPage == DrawerSections.tours ? true : false,
          ),
          Divider(
            color: kPrimaryColor.withOpacity(0.8),
          ),
          MenuItem(
            currentPage: currentPage,
            id: 4,
            title: "Settings",
            iconData: Icons.settings_outlined,
            selected: currentPage == DrawerSections.settings ? true : false,
          ),
          MenuItem(
            currentPage: currentPage,
            id: 5,
            title: "Notifications",
            iconData: Icons.notifications_outlined,
            selected:
                currentPage == DrawerSections.notifications ? true : false,
          ),
          Divider(
            color: kPrimaryColor.withOpacity(0.8),
          ),
          MenuItem(
            currentPage: currentPage,
            id: 6,
            title: "About",
            iconData: Icons.info_outlined,
            selected: currentPage == DrawerSections.about ? true : false,
          ),
          // Text("${SizeConfig.screenHeight}"),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final DrawerSections currentPage;
  final int id;
  final String title;
  final IconData iconData;
  final bool selected;

  const MenuItem({
    Key? key,
    required this.currentPage,
    required this.id,
    required this.title,
    required this.iconData,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  iconData,
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
}

enum DrawerSections {
  dashboard,
  liked,
  tours,
  settings,
  notifications,
  about,
}
