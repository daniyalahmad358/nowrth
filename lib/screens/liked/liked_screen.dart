import 'package:flutter/material.dart';
import 'package:nowrth/components/app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/components/drawer_components.dart';

import 'components/body.dart';

class LikedScreen extends StatelessWidget {
  final currentPage = DrawerSections.liked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Liked Spots", barOpacity: 0.9),
      body: Body(),
      bottomNavigationBar: CustomBottonNavBar(isAtLiked: true),
      extendBodyBehindAppBar: true,
      drawer: buildDrawer(context, currentPage),
    );
  }
}
