import 'package:flutter/material.dart';

import 'package:nowrth/constants/app_colors.dart';
import 'package:nowrth/constants/app_pages.dart';

import 'package:nowrth/components/drawer/custom_drawer.dart';
import 'package:nowrth/components/drawer/services/check_on_page.dart';

import 'package:nowrth/screens/home/home_screen.dart';
import 'package:nowrth/screens/liked/liked_screen.dart';
import 'package:nowrth/screens/contribution/contributions/contributions_screen.dart';
import 'package:nowrth/screens/in_app_notifications/in_app_notifcations_screen.dart';

List<Widget> menuItems(BuildContext context, AppPage currentPage) {
  return <Widget>[
    MenuItem(
      title: 'Home',
      iconData: Icons.home_outlined,
      selected: isOnPage(currentPage, AppPage.home),
      onTap: !isOnPage(currentPage, AppPage.home)
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            }
          : null,
    ),
    MenuItem(
      title: 'Liked',
      iconData: Icons.favorite_border,
      selected: isOnPage(currentPage, AppPage.liked),
      onTap: !isOnPage(currentPage, AppPage.liked)
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LikedScreen(),
                ),
              );
            }
          : null,
    ),
    MenuItem(
      title: 'Tours',
      iconData: Icons.explore_outlined,
      selected: isOnPage(currentPage, AppPage.tours),
      onTap: !isOnPage(currentPage, AppPage.tours) ? null : null,
    ),
    MenuItem(
      title: 'Contributions',
      iconData: Icons.add_circle_outline,
      selected: isOnPage(currentPage, AppPage.contributions),
      onTap: !isOnPage(currentPage, AppPage.contributions)
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContributionsScreen(),
                ),
              );
            }
          : null,
    ),
    Divider(
      color: kPrimaryColor.withOpacity(0.8),
    ),
    MenuItem(
      title: 'Notifications',
      iconData: Icons.notifications_outlined,
      selected: isOnPage(currentPage, AppPage.notifications),
      onTap: !isOnPage(currentPage, AppPage.notifications)
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InAppNotificationsScreen(),
                ),
              );
            }
          : null,
    ),
    MenuItem(
      title: 'Settings',
      iconData: Icons.settings_outlined,
      selected: isOnPage(currentPage, AppPage.settings),
      onTap: !isOnPage(currentPage, AppPage.settings) ? null : null,
    ),
    Divider(
      color: kPrimaryColor.withOpacity(0.8),
    ),
    MenuItem(
      title: 'About',
      iconData: Icons.info_outlined,
      selected: isOnPage(currentPage, AppPage.about),
      onTap: !isOnPage(currentPage, AppPage.about) ? null : null,
    ),
  ];
}
