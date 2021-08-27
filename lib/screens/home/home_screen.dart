import 'package:flutter/material.dart';

import 'package:nowrth/components/app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/components/drawer/drawer_components.dart';

import 'package:nowrth/screens/home/components/home_body.dart';

class HomeScreen extends StatelessWidget {
  final currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(context, barOpacity: 0.0),
      body: HomeBody(),
      bottomNavigationBar: CustomBottonNavBar(isAtHome: true),
      drawer: CustomDrawer(currentPage: currentPage),
    );
  }
}
