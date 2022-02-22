import 'package:flutter/material.dart';
import 'package:nowrth/components/custom_app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/components/drawer/custom_drawer.dart';
import 'package:nowrth/global/background_image.dart';
import 'package:nowrth/models/classes/contribution.dart';
import 'package:nowrth/models/classes/spot.dart';
import 'package:nowrth/models/enums/app_pages.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/add_edit_contribution_body.dart';
import 'package:nowrth/screens/contribution/contributions/contributions_body.dart';
import 'package:nowrth/screens/details/details_body.dart';
import 'package:nowrth/screens/home/home_body.dart';
import 'package:nowrth/screens/in_app_notifications/in_app_notifications_body.dart';
import 'package:nowrth/screens/initial_pages/login/login_body.dart';
import 'package:nowrth/screens/initial_pages/signup/signup_body.dart';
import 'package:nowrth/screens/initial_pages/welcome/welcome_body.dart';
import 'package:nowrth/screens/liked/liked_body.dart';
import 'package:nowrth/screens/splash/splash_body.dart';

class PageData {
  late AppPage appPage;
  late DecorationImage? backgroundDecorationImage;
  late Color? scaffoldColor;
  late CustomAppBar? appBar;
  late bool? behindAppBar;
  late CustomDrawer? drawer;
  late Widget body;
  late CustomBottomNavBar? bottomNavBar;
  late bool? behindBottomNavBar;

  PageData({
    required this.appPage,
    this.backgroundDecorationImage,
    this.scaffoldColor,
    this.appBar,
    this.behindAppBar,
    this.drawer,
    required this.body,
    this.bottomNavBar,
    this.behindBottomNavBar,
  });

  PageData.fromPage(
    AppPage page, {
    required void Function({required PageData newPageData}) updateScaffold,
    Spot? spot,
    List<ContributionListItem>? contributionListItems,
    dynamic Function()? contributionsPageRefresher,
    int? contributionToEditId,
  }) {
    appPage = page;
    backgroundDecorationImage = _getBackgroundDecorationImage(page);
    scaffoldColor = _getScaffoldColor(page);
    appBar = _getAppBar(page, spotName: spot?.spotName);
    behindAppBar = _getBehindAppBar(page);
    drawer = _getDrawer(page);
    body = _getBody(
      page,
      updateScaffold: updateScaffold,
      spot: spot,
      contributionListItems: contributionListItems,
      contributionsPageRefresher: contributionsPageRefresher,
      contributionToEditId: contributionToEditId,
    );
    bottomNavBar = _getBottomNavBar(page);
    behindBottomNavBar = _getBehindBottomNavBar(page);
  }

  static Widget _getBody(
    AppPage page, {
    required void Function({required PageData newPageData}) updateScaffold,
    Spot? spot,
    List<ContributionListItem>? contributionListItems,
    dynamic Function()? contributionsPageRefresher,
    int? contributionToEditId,
  }) {
    switch (page) {
      case AppPage.splash:
        return const SplashBody();
      case AppPage.welcome:
        return const WelcomeBody();
      case AppPage.login:
        return LoginBody();
      case AppPage.signup:
        return SignupBody();
      case AppPage.home:
        return const HomeBody();
      case AppPage.liked:
        return const LikedBody();
      case AppPage.details:
        return DetailsBody(spot: spot!);
      case AppPage.inAppNotifications:
        return InAppNotificationsBody();
      case AppPage.contributions:
        return ContributionsBody(allContributions: contributionListItems!);
      case AppPage.addContribution:
      case AppPage.editContribution:
        return AddEditContributionBody(
          currentPage: page,
          contributionListItems: contributionListItems!,
          contributionsPageRefresher: contributionsPageRefresher!,
          contributionToEditId: contributionToEditId,
        );
      case AppPage.tours:
      case AppPage.settings:
      case AppPage.about:
      default:
        return const HomeBody();
    }
  }

  static DecorationImage? _getBackgroundDecorationImage(AppPage page) {
    switch (page) {
      case AppPage.home:
        return const DecorationImage(
          image: backgroundImage,
          colorFilter: ColorFilter.linearToSrgbGamma(),
          fit: BoxFit.cover,
        );
      case AppPage.splash:
      case AppPage.welcome:
      case AppPage.login:
      case AppPage.signup:
      case AppPage.liked:
      case AppPage.details:
      case AppPage.route:
      case AppPage.inAppNotifications:
      case AppPage.contributions:
      case AppPage.addContribution:
      case AppPage.editContribution:
      case AppPage.tours:
      case AppPage.settings:
      case AppPage.about:
        return null;
    }
  }

  static Color? _getScaffoldColor(AppPage page) {
    switch (page) {
      case AppPage.home:
        return Colors.transparent;
      case AppPage.welcome:
      case AppPage.splash:
      case AppPage.login:
      case AppPage.signup:
      case AppPage.liked:
      case AppPage.details:
      case AppPage.route:
      case AppPage.inAppNotifications:
      case AppPage.contributions:
      case AppPage.addContribution:
      case AppPage.editContribution:
      case AppPage.tours:
      case AppPage.settings:
      case AppPage.about:
        return null;
    }
  }

  static CustomAppBar? _getAppBar(AppPage page, {String? spotName}) {
    switch (page) {
      case AppPage.home:
        return CustomAppBar(currentPage: page, barOpacity: 0.0);
      case AppPage.details:
      case AppPage.route:
        return CustomAppBar(currentPage: page, titleText: spotName!);
      case AppPage.liked:
        return CustomAppBar(currentPage: page, titleText: 'Liked Spots');
      case AppPage.inAppNotifications:
        return CustomAppBar(currentPage: page, titleText: 'Notifications');
      case AppPage.contributions:
        return CustomAppBar(currentPage: page, titleText: 'Contributions');
      case AppPage.addContribution:
        return CustomAppBar(currentPage: page, titleText: 'Add Contribution');
      case AppPage.editContribution:
        return CustomAppBar(currentPage: page, titleText: 'Edit Contribution');
      case AppPage.tours:
      case AppPage.settings:
      case AppPage.about:
      case AppPage.splash:
      case AppPage.welcome:
      case AppPage.login:
      case AppPage.signup:
        return null;
    }
  }

  static bool? _getBehindAppBar(AppPage page) {
    switch (page) {
      case AppPage.route:
        return false;
      case AppPage.home:
      case AppPage.liked:
      case AppPage.details:
      case AppPage.inAppNotifications:
      case AppPage.contributions:
      case AppPage.addContribution:
      case AppPage.editContribution:
        return true;
      case AppPage.tours:
      case AppPage.settings:
      case AppPage.about:
      case AppPage.splash:
      case AppPage.welcome:
      case AppPage.login:
      case AppPage.signup:
        return false;
    }
  }

  static CustomDrawer? _getDrawer(AppPage page) {
    switch (page) {
      case AppPage.home:
      case AppPage.liked:
      case AppPage.details:
      case AppPage.route:
      case AppPage.inAppNotifications:
      case AppPage.contributions:
      case AppPage.addContribution:
      case AppPage.editContribution:
        return CustomDrawer(currentPage: page);
      case AppPage.tours:
      case AppPage.settings:
      case AppPage.about:
      case AppPage.splash:
      case AppPage.welcome:
      case AppPage.login:
      case AppPage.signup:
        return null;
    }
  }

  static CustomBottomNavBar? _getBottomNavBar(AppPage page) {
    switch (page) {
      case AppPage.home:
        return CustomBottomNavBar(
          currentPage: page,
          bottomImage: backgroundImage,
        );
      case AppPage.liked:
      case AppPage.details:
      case AppPage.route:
      case AppPage.inAppNotifications:
      case AppPage.contributions:
      case AppPage.addContribution:
      case AppPage.editContribution:
        return CustomBottomNavBar(currentPage: page);
      case AppPage.tours:
      case AppPage.settings:
      case AppPage.about:
      case AppPage.splash:
      case AppPage.welcome:
      case AppPage.login:
      case AppPage.signup:
        return null;
    }
  }

  static bool? _getBehindBottomNavBar(AppPage page) {
    switch (page) {
      case AppPage.route:
        return false;
      case AppPage.home:
      case AppPage.liked:
      case AppPage.details:
      case AppPage.inAppNotifications:
      case AppPage.contributions:
      case AppPage.addContribution:
      case AppPage.editContribution:
        return true;
      case AppPage.splash:
      case AppPage.welcome:
      case AppPage.login:
      case AppPage.signup:
      case AppPage.tours:
      case AppPage.settings:
      case AppPage.about:
        return false;
    }
  }
}
