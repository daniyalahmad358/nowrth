import 'package:flutter/material.dart';
import 'package:nowrth/components/app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/components/drawer_components.dart';
import 'package:nowrth/screens/home/components/body.dart';

// import 'package:nowrth/size_config.dart';

class HomeScreen extends StatelessWidget {
  final currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(context, barOpacity: 0.0),
      body: Body(),
      bottomNavigationBar: CustomBottonNavBar(isAtHome: true),
      drawer: buildDrawer(context, currentPage),
    );
  }
}
