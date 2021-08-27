import 'package:flutter/material.dart';
import 'package:nowrth/components/app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/components/drawer/drawer_components.dart';

import 'components/liked_body.dart';

class LikedScreen extends StatelessWidget {
  final currentPage = DrawerSections.liked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, titleText: "Liked Spots", barOpacity: 0.9),
      body: LikedBody(),
      bottomNavigationBar: CustomBottonNavBar(isAtLiked: true),
      extendBodyBehindAppBar: true,
      drawer: CustomDrawer(currentPage: currentPage),
    );
  }
}
