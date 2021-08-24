import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nowrth/components/custom_floating_action_button.dart';
// import 'package:nowrth/components/mdIcons/material_design_icons_flutter.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:nowrth/models/travel_spot.dart';

import 'package:nowrth/components/app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/screens/details/components/details_body.dart';
import 'package:nowrth/screens/route/route_screen.dart';

class Details extends StatelessWidget {
  Details({required this.travelSpot});

  final TravelSpot travelSpot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(context, titleText: travelSpot.name, barOpacity: 0.9),
      body: DetailsBody(travelSpot: travelSpot),
      floatingActionButton: CustomFloatingActionButton(
        iconData: Icons.timeline,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RouteScreen(travelSpot: travelSpot),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottonNavBar(),
      extendBodyBehindAppBar: true,
    );
  }
}
