import 'package:flutter/material.dart';

// import 'package:timelines/timelines.dart';

// import 'package:nowrth/constants.dart';
import 'package:nowrth/screens/route/components/custom_timeline.dart';
import 'package:nowrth/size_config.dart';

import 'package:nowrth/models/travel_spot.dart';

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
    return CustomTimeline(
      timelineContents: <Widget>[
        ...List.generate(
          widget.travelSpot.stopBySpots.length,
          (index) => StopBySpotCard(
            heroTag: "stopBySpot_$index",
            stopBySpot: widget.travelSpot.stopBySpots[index],
            // press: () {},
          ),
        )
      ],
    );
  }
}
