import 'package:flutter/material.dart';
import 'package:nowrth/global/background_image.dart';
import 'package:nowrth/global/size_config.dart';

import 'components/home_header.dart';
import 'components/top_travel_spots.dart';
import 'components/top_guides.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call SizeConfig on your starting page
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: SafeArea(
        top: false,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: backgroundImage,
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
    );
  }
}
