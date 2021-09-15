import 'package:flutter/material.dart';
import 'package:nowrth/components/custom_floating_action_button.dart';
import 'package:nowrth/models/enums/app_pages.dart';

import 'package:nowrth/models/classes/spot.dart';

import 'package:nowrth/components/custom_app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/screens/details/components/details_body.dart';
import 'package:nowrth/screens/route/route_screen.dart';

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
        context,
        titleText: spot.spotName,
        atPage: currentPage,
      ),
      body: DetailsBody(spot: spot),
      floatingActionButton: CustomFloatingActionButton(
        iconData: Icons.timeline,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RouteScreen(destinationSpot: spot),
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottonNavBar(),
      extendBodyBehindAppBar: true,
    );
  }
}
