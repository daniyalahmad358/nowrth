import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:nowrth/screens/route/components/content_widget.dart';

import 'package:nowrth/screens/route/components/custom_timeline.dart';
import 'package:nowrth/screens/route/services/content_side_decider.dart';
import 'package:nowrth/constants/size_config.dart';

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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Svg('assets/images/map_illustration.svg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.linearToSrgbGamma(),
        ),
      ),
      child: CustomTimeline(
        timelineContents: <TimelineContent>[
          ...List.generate(
            widget.travelSpot.stopBySpots.length,
            (index) => TimelineContent(
              contentSide: stopBySpotCardSideDecider(
                widget.travelSpot.stopBySpots[index].stopType,
              ),
              child: StopBySpotCard(
                heroTag: "stopBySpot_$index",
                stopBySpot: widget.travelSpot.stopBySpots[index],
                spotButtonSide: spotButtonSideDecider(stopBySpotCardSideDecider(
                  widget.travelSpot.stopBySpots[index].stopType,
                )),
                // press: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
