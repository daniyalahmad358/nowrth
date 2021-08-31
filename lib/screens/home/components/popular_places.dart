import 'package:flutter/material.dart';
import 'package:nowrth/components/travel_spot_card/travel_spot_card.dart';
import 'package:nowrth/components/section_title.dart';
import 'package:nowrth/constants/app_shadows.dart';
import 'package:nowrth/models/travel_spot.dart';
// import 'package:nowrth/screens/details/details_screen.dart';

import 'package:nowrth/constants/size_config.dart';

class PopularPlaces extends StatelessWidget {
  const PopularPlaces({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionTitle(
          title: "Right Now At Spark",
          press: () {},
        ),
        VerticalSpacing(of: 20),
        SingleChildScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              ...List.generate(
                travelSpots.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(kDefaultPadding)),
                  child: TravelSpotCard(
                    travelSpot: travelSpots[index],
                  ),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(kDefaultPadding),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
