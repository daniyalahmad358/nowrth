import 'package:flutter/material.dart';
import 'package:nowrth/components/drawer/menu_items.dart';

import 'package:nowrth/constants/app_pages.dart';

import 'package:nowrth/components/custom_app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/components/drawer/custom_drawer.dart';

import 'components/liked_body.dart';

class LikedScreen extends StatelessWidget {
  final currentPage = AppPage.liked;
  const LikedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        titleText: 'Liked Spots',
        atPage: currentPage,
      ),
      body: LikedBody(),
      bottomNavigationBar: CustomBottonNavBar(isAtLiked: true),
      extendBodyBehindAppBar: true,
      drawer: CustomDrawer(
        currentPage: currentPage,
        menuItems: menuItems(context, currentPage),
      ),
    );
  }
}
