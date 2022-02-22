import 'package:flutter/material.dart';
import 'package:nowrth/global/background_image.dart';

import 'package:nowrth/models/enums/app_pages.dart';

import 'package:nowrth/components/custom_app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/components/drawer/custom_drawer.dart';

import 'home_body.dart';

class HomeScreen extends StatelessWidget {
  final currentPage = AppPage.home;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: backgroundImage,
          colorFilter: ColorFilter.linearToSrgbGamma(),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          barOpacity: 0.0,
          currentPage: currentPage,
        ),
        body: const HomeBody(),
        extendBody: true,
        bottomNavigationBar: CustomBottomNavBar(
          currentPage: currentPage,
          bottomImage: backgroundImage,
        ),
        drawer: CustomDrawer(currentPage: currentPage),
      ),
    );
  }
}
