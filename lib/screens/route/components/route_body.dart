import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'package:nowrth/constants/size_config.dart';

import 'package:nowrth/models/spot.dart';

import 'package:nowrth/screens/route/services/content_side_decider.dart';

import 'content_widget.dart';
import 'custom_timeline.dart';
import 'stop_by_spot_card.dart';

// Has to be stateful
class RouteBody extends StatefulWidget {
  RouteBody({
    required this.destinationSpot,
  });

  final Spot destinationSpot;

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
            (widget.destinationSpot.stopBySpots != null)
                ? widget.destinationSpot.stopBySpots!.length
                : 0,
            (index) => TimelineContent(
              contentSide: stopBySpotCardSideDecider(
                widget.destinationSpot.stopBySpots![index].spotType,
              ),
              child: StopBySpotCard(
                heroTag: "stopBySpot_$index",
                stopBySpot: widget.destinationSpot.stopBySpots![index],
                spotButtonSide: spotButtonSideDecider(
                  stopBySpotCardSideDecider(
                    widget.destinationSpot.stopBySpots![index].spotType,
                  ),
                ),
                // press: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
