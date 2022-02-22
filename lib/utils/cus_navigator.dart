import 'package:flutter/material.dart';
import 'package:nowrth/global/route_history.dart';
import 'package:nowrth/models/enums/app_pages.dart';

class CusNavigator {
  static void _removeFromStackTill(String routeName) {
    for (int i = routeHistory.length - 1;
        i > routeHistory.indexOf(routeName);
        i++) {
      routeHistory.removeAt(i);
    }
  }

  static bool _existsInStack(String routeName) {
    if (routeHistory.contains(routeName)) {
      return true;
    }
    return false;
  }

  static dynamic pushNamed<T extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    if (_existsInStack(routeName)) {
      _removeFromStackTill(routeName);
      return Navigator.popUntil(context, ModalRoute.withName(routeName));
    }

    routeHistory.add(routeName);
    return Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static Future<T?> pushRemAll<T extends Object?>(
    BuildContext context,
    Route<T> newRoute,
  ) {
    return Navigator.pushAndRemoveUntil(
      context,
      newRoute,
      (route) => false,
    );
  }

  static Future<T?> pushNamedRemAll<T extends Object?>(
    BuildContext context,
    String newRouteName, {
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      newRouteName,
      (route) => false,
      arguments: arguments,
    );
  }

  static Future<T?> pushRemTilHome<T extends Object?>(
    BuildContext context,
    Route<T> newRoute,
  ) {
    return Navigator.pushAndRemoveUntil(
      context,
      newRoute,
      ModalRoute.withName(AppPage.home.name),
    );
  }

  static Future<T?> pushNamedRemTilHome<T extends Object?>(
    BuildContext context,
    String newRouteName, {
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      newRouteName,
      ModalRoute.withName(AppPage.home.name),
      arguments: arguments,
    );
  }
}
