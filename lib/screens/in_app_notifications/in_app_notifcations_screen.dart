import 'package:flutter/material.dart';
import 'package:nowrth/components/custom_app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/constants/app_pages.dart';

import 'components/in_app_notifications_body.dart';

class InAppNotificationsScreen extends StatelessWidget {
  final currentPage = AppPage.liked;

  const InAppNotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        titleText: 'Notifications',
        atPage: currentPage,
      ),
      body: InAppNotificationsBody(),
      bottomNavigationBar: const CustomBottonNavBar(),
      extendBodyBehindAppBar: true,
    );
  }
}
