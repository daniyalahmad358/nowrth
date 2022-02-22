import 'package:flutter/material.dart';
import 'package:nowrth/components/custom_app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/models/enums/app_pages.dart';

import 'in_app_notifications_body.dart';

class InAppNotificationsScreen extends StatelessWidget {
  final currentPage = AppPage.inAppNotifications;

  const InAppNotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Notifications',
        currentPage: currentPage,
      ),
      body: InAppNotificationsBody(),
      bottomNavigationBar: CustomBottomNavBar(currentPage: currentPage),
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }
}
