import 'package:flutter/material.dart';

import 'package:nowrth/constants.dart';
import 'package:nowrth/size_config.dart';

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
      appBar: buildAppBar(context, title: travelSpot.name, barOpacity: 0.9),
      body: DetailsBody(travelSpot: travelSpot),
      floatingActionButton: SizedBox(
        height: percentageHeight(8.13),
        width: percentageHeight(8.13),
        child: FittedBox(
          child: FloatingActionButton(
            child: Icon(
              Icons.map_outlined,
              color: Colors.white,
            ),
            backgroundColor: kPrimaryColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RouteScreen(travelSpot: travelSpot),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: CustomBottonNavBar(),
      extendBodyBehindAppBar: true,
    );
  }
}
