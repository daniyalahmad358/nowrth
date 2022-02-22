import 'package:flutter/material.dart';

import 'package:nowrth/models/enums/app_pages.dart';

import 'package:nowrth/components/custom_app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/components/drawer/custom_drawer.dart';

import 'liked_body.dart';

class LikedScreen extends StatelessWidget {
  final currentPage = AppPage.liked;
  const LikedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Liked Spots',
        currentPage: currentPage,
      ),
      body: const LikedBody(),
      bottomNavigationBar: CustomBottomNavBar(currentPage: currentPage),
      drawer: CustomDrawer(currentPage: currentPage),
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }
}
