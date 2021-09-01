import 'package:flutter/material.dart';
import 'package:nowrth/components/app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/constants/app_pages.dart';
import 'package:nowrth/screens/in_app_notifications/components/in_app_notifications_body.dart';

class InAppNotificationsScreen extends StatelessWidget {
  final currentPage = AppPage.liked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        titleText: "Notifications",
        barOpacity: 0.9,
        onNotiPage: true,
      ),
      body: InAppNotificationsBody(),
      bottomNavigationBar: CustomBottonNavBar(),
      extendBodyBehindAppBar: true,
    );
  }
}
