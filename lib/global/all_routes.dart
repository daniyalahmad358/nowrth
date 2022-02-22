import 'package:flutter/widgets.dart';
import 'package:nowrth/models/enums/app_pages.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/add_edit_contribution_screen.dart';
import 'package:nowrth/screens/contribution/contributions/contributions_screen.dart';
import 'package:nowrth/screens/home/home_screen.dart';
import 'package:nowrth/screens/in_app_notifications/in_app_notifications_screen.dart';
import 'package:nowrth/screens/initial_pages/login/login_screen.dart';
import 'package:nowrth/screens/initial_pages/signup/signup_screen.dart';
import 'package:nowrth/screens/initial_pages/welcome/welcome_screen.dart';
import 'package:nowrth/screens/liked/liked_screen.dart';
import 'package:nowrth/screens/route/route_screen.dart';
import 'package:nowrth/screens/splash/splash_screen.dart';

Map<String, Widget Function(BuildContext)> allRoutes = {
  AppPage.splash.name: (ctx) => const SplashScreen(),
  AppPage.welcome.name: (ctx) => const WelcomeScreen(),
  AppPage.signup.name: (ctx) => const SignUpScreen(),
  AppPage.login.name: (ctx) => const LoginScreen(),
  AppPage.home.name: (ctx) => const HomeScreen(),
  AppPage.liked.name: (ctx) => const LikedScreen(),
  AppPage.route.name: (ctx) => const RouteScreen(),
  AppPage.contributions.name: (ctx) => const ContributionsScreen(),
  AppPage.addContribution.name: (ctx) => const AddEditContributionScreen(
        page: AppPage.addContribution,
      ),
  AppPage.editContribution.name: (ctx) => const AddEditContributionScreen(
        page: AppPage.editContribution,
      ),
  AppPage.inAppNotifications.name: (ctx) => const InAppNotificationsScreen(),
};
