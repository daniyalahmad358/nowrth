import 'package:flutter/material.dart';

import 'package:nowrth/constants.dart';

import 'package:nowrth/components/app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/screens/details/components/body.dart';
import 'package:nowrth/models/TravelSpot.dart';

// import 'package:nowrth/size_config.dart';

class Details extends StatelessWidget {
  Details({@required this.travelSpot});

  final TravelSpot travelSpot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: travelSpot.name, barOpacity: 0.9),
      body: Body(travelSpot: travelSpot),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.map_outlined,
          color: Colors.white,
        ),
        backgroundColor: kPrimaryColor,
        onPressed: () {},
      ),
      bottomNavigationBar: CustomBottonNavBar(),
      extendBodyBehindAppBar: true,
    );
  }

/*
  buildSlider() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: travelSpots == null ? 0 : travelSpots.length,
        itemBuilder: (BuildContext context, int index) {
          TravelSpot travelSpot = travelSpots[index];

          return Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                travelSpot.image,
                height: 250.0,
                width: SizeConfig.screenWidth - 40.0,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
*/
}