import 'package:flutter/material.dart';
import 'package:nowrth/global/size_config.dart';

import 'home_header.dart';
import 'top_travel_spots.dart';
import 'top_guides.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call SizeConfig on your starting page
    SizeConfig().init(context);
    return Theme(
      data: Theme.of(context),
      child: SingleChildScrollView(
        child: SafeArea(
          top: false,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/app_images/home_bg.jpg'),
                colorFilter: ColorFilter.linearToSrgbGamma(),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: const <Widget>[
                HomeHeader(),
                VerticalSpacing(),
                TopTravelSpotsFrame(),
                VerticalSpacing(),
                TopGuidesFrame(),
                VerticalSpacing(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
