import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nowrth/components/drawer/menu_items.dart';

import 'package:nowrth/models/enums/app_pages.dart';
import 'package:nowrth/global/size_config.dart'; // Needed

import 'my_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  final AppPage currentPage;
  const CustomDrawer({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.5),
      width: percentageHeight(35),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: ListView(
            children: <Widget>[
              const MyHeaderDrawer(),
              CustomDrawerMenu(
                currentPage: currentPage,
                menuItems: menuItems(context, currentPage),
              ),
            ],
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
      margin: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(children: menuItems),
    );
  }
}

class CustomMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final bool selected;
  final void Function()? onTap;

  const CustomMenuItem({
    Key? key,
    required this.title,
    required this.iconData,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        if (onTap != null) onTap!();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 13,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: IconTheme(
                data: Theme.of(context).primaryIconTheme.copyWith(
                      size: 19,
                    ),
                child: Icon(
                  iconData,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context).primaryTextTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
