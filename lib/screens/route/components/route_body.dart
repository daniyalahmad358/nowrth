import 'package:flutter/material.dart';

import 'package:timelines/timelines.dart';

import 'package:nowrth/constants.dart';
import 'package:nowrth/size_config.dart';

import 'package:nowrth/models/travel_spot.dart';
import 'package:nowrth/models/stop_by_spot.dart';

import 'package:nowrth/screens/route/components/stop_by_spot_card.dart';

// Has to be stateful
class RouteBody extends StatefulWidget {
  RouteBody({
    required this.travelSpot,
  });

  final TravelSpot travelSpot;

  @override
  _RouteBodyState createState() => _RouteBodyState();
}

class _RouteBodyState extends State<RouteBody> {
  @override
  Widget build(BuildContext context) {
    // You have to call SizeConfig on your starting page
    SizeConfig().init(context);
    return Timeline.tileBuilder(
      builder: TimelineTileBuilder.connectedFromStyle(
        contentsAlign: ContentsAlign.alternating,
        contentsBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(kDefaultPadding)),
          child: StopBySpotCard(
            stopBySpot: stopBySpots[index],
            // press: () {},
          ),
        ),
        itemCount: 3,
      ),
    );
  }
}
