import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:nowrth/size_config.dart';

import 'home_header.dart';
import 'top_travel_spots.dart';
import 'top_guides.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You have to call SizeConfig on your starting page
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: SafeArea(
        top: false,
        child: Container(
          // color: Colors.blueGrey,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Svg("assets/images/map_illustration.svg"),
              colorFilter: ColorFilter.linearToSrgbGamma(),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              HomeHeader(),
              VerticalSpacing(),
              TopTravelSpots(),
              VerticalSpacing(),
              TopGuides(),
              VerticalSpacing(),
            ],
          ),
        ),
      ),
    );
  }
}
