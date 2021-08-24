import 'package:flutter/material.dart';
import 'package:nowrth/components/custom_floating_action_button.dart';

import 'package:nowrth/models/travel_spot.dart';
import 'package:nowrth/components/app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';

import 'package:nowrth/screens/route/components/route_body.dart';

class RouteScreen extends StatelessWidget {
  RouteScreen({required this.travelSpot});

  final TravelSpot travelSpot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(context, titleText: travelSpot.name, barOpacity: 0.9),
      body: RouteBody(travelSpot: travelSpot),
      bottomNavigationBar: CustomBottonNavBar(),
      floatingActionButton: CustomFloatingActionButton(
        iconData: Icons.map_outlined,
        onPressed: () {},
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
