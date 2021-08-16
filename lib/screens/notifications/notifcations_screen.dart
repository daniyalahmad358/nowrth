import 'package:flutter/material.dart';
import 'package:nowrth/components/app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/components/drawer/drawer_components.dart';

import 'components/notifications_body.dart';

class NotificationsScreen extends StatelessWidget {
  final currentPage = DrawerSections.liked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "Notifications",
        barOpacity: 0.9,
        onNotiPage: true,
      ),
      body: NotificationsBody(),
      bottomNavigationBar: CustomBottonNavBar(),
      extendBodyBehindAppBar: true,
    );
  }
}
