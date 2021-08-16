import 'package:flutter/material.dart';
import 'package:nowrth/components/travel_spot_card.dart';
import 'package:nowrth/components/section_title.dart';
import 'package:nowrth/models/travel_spot.dart';
// import 'package:nowrth/screens/details/details_screen.dart';

import 'package:nowrth/constants.dart';
import 'package:nowrth/size_config.dart';

class PopularPlaces extends StatelessWidget {
  const PopularPlaces({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "Right Now At Spark",
          press: () {},
        ),
        VerticalSpacing(of: 20),
        SingleChildScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                travelSpots.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(kDefaultPadding)),
                  child: TravelSpotCard(
                    travelSpot: travelSpots[index],
                    likeControl: () {},
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
