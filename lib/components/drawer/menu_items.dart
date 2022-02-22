import 'package:flutter/material.dart';

import 'package:nowrth/models/classes/contribution.dart';
import 'package:nowrth/models/enums/app_pages.dart';

import 'package:nowrth/components/drawer/custom_drawer.dart';
import 'package:nowrth/providers/route_providers.dart';
import 'package:nowrth/services/check_on_page.dart';

import 'package:nowrth/screens/contribution/contributions/contributions_screen.dart';
import 'package:nowrth/utils/cus_navigator.dart';

List<Widget> menuItems(BuildContext context, AppPage currentPage) {
  return <Widget>[
    MenuItem(
      title: 'Home',
      iconData: Icons.home_outlined,
      selected: isOnPage(currentPage, AppPage.home),
      onTap: !isOnPage(currentPage, AppPage.home)
          ? () {
              CusNavigator.pushNamedRemTilHome(context, AppPage.home.name);
            }
          : null,
    ),
    MenuItem(
      title: 'Liked',
      iconData: Icons.favorite_border,
      selected: isOnPage(currentPage, AppPage.liked),
      onTap: !isOnPage(currentPage, AppPage.liked)
          ? () {
              CusNavigator.pushNamedRemTilHome(context, AppPage.liked.name);
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
              List<ContributionListItem> contributionListItems = [];
              AllContributionsLIProvider.allContributionsLi =
                  contributionListItems;

              CusNavigator.pushRemTilHome(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContributionsScreen(),
                ),
              );
            }
          : null,
    ),
    const Divider(
        // color: kPrimaryColor.withOpacity(0.8),
        ),
    MenuItem(
      title: 'Notifications',
      iconData: Icons.notifications_outlined,
      selected: isOnPage(currentPage, AppPage.inAppNotifications),
      onTap: !isOnPage(currentPage, AppPage.inAppNotifications)
          ? () {
              CusNavigator.pushNamedRemTilHome(
                context,
                AppPage.inAppNotifications.name,
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
    const Divider(
        // color: kPrimaryColor.withOpacity(0.8),
        ),
    MenuItem(
      title: 'About',
      iconData: Icons.info_outlined,
      selected: isOnPage(currentPage, AppPage.about),
      onTap: !isOnPage(currentPage, AppPage.about) ? null : null,
    ),
  ];
}
