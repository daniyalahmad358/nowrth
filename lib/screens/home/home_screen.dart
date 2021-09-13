import 'package:flutter/material.dart';

import 'package:nowrth/constants/app_pages.dart';

import 'package:nowrth/components/custom_app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/components/drawer/custom_drawer.dart';
import 'package:nowrth/components/drawer/menu_items.dart';

import 'components/home_body.dart';

class HomeScreen extends StatelessWidget {
  final currentPage = AppPage.home;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        context,
        barOpacity: 0.0,
        atPage: currentPage,
      ),
      body: const HomeBody(),
      bottomNavigationBar: const CustomBottonNavBar(isAtHome: true),
      drawer: CustomDrawer(
        currentPage: currentPage,
        menuItems: menuItems(context, currentPage),
      ),
    );
  }
}
