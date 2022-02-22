import 'package:flutter/material.dart';
import 'package:nowrth/components/custom_floating_action_button.dart';
import 'package:nowrth/models/enums/app_pages.dart';

import 'package:nowrth/models/classes/spot.dart';

import 'package:nowrth/components/custom_app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/providers/route_providers.dart';
import 'package:nowrth/screens/details/details_body.dart';
import 'package:nowrth/screens/route/route_screen.dart';
import 'package:nowrth/utils/cus_navigator.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.spot,
  }) : super(key: key);

  final Spot spot;
  final AppPage currentPage = AppPage.details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: spot.spotName,
        currentPage: currentPage,
      ),
      body: DetailsBody(spot: spot),
      floatingActionButton: CustomFloatingActionButton(
        iconData: Icons.timeline,
        onPressed: () {
          SelectedSpotProvider.selectedSpot = spot;
          CusNavigator.pushRemTilHome(
            context,
            MaterialPageRoute(
              builder: (context) => const RouteScreen(),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(currentPage: currentPage),
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }
}
