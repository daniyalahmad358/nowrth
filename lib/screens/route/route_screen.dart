import 'package:flutter/material.dart';
import 'package:nowrth/components/custom_floating_action_button.dart';
import 'package:nowrth/models/enums/app_pages.dart';

import 'package:nowrth/models/classes/spot.dart';
import 'package:nowrth/components/custom_app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/providers/route_providers.dart';

import 'route_body.dart';

class RouteScreen extends StatelessWidget {
  final currentPage = AppPage.route;

  const RouteScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Spot selectedSpot = SelectedSpotProvider.getSelectedSpot;
    return Scaffold(
      appBar: CustomAppBar(
        titleText: selectedSpot.spotName,
        currentPage: currentPage,
      ),
      body: RouteBody(destinationSpot: selectedSpot),
      bottomNavigationBar: CustomBottomNavBar(currentPage: currentPage),
      floatingActionButton: CustomFloatingActionButton(
        iconData: Icons.map_outlined,
        onPressed: () {},
      ),
      extendBodyBehindAppBar: false,
      extendBody: false,
    );
  }
}
