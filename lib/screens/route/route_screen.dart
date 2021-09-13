import 'package:flutter/material.dart';
import 'package:nowrth/components/custom_floating_action_button.dart';
import 'package:nowrth/constants/app_pages.dart';

import 'package:nowrth/models/spot.dart';
import 'package:nowrth/components/custom_app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';

import 'components/route_body.dart';

class RouteScreen extends StatelessWidget {
  final Spot destinationSpot;
  final currentPage = AppPage.liked;

  const RouteScreen({
    Key? key,
    required this.destinationSpot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        titleText: destinationSpot.spotName,
        atPage: currentPage,
      ),
      body: RouteBody(destinationSpot: destinationSpot),
      bottomNavigationBar: const CustomBottonNavBar(),
      floatingActionButton: CustomFloatingActionButton(
        iconData: Icons.map_outlined,
        onPressed: () {},
      ),
      // backgroundColor: Colors.blueGrey,
      extendBodyBehindAppBar: false,
    );
  }
}
