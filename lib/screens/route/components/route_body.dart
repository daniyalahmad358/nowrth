import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'package:nowrth/constants/size_config.dart';

import 'package:nowrth/models/classes/spot.dart';

import 'package:nowrth/services/content_side_decider.dart';

import 'timeline_content.dart';
import 'custom_timeline.dart';
import 'stop_by_spot_card.dart';

// Has to be stateful
class RouteBody extends StatelessWidget {
  final Spot destinationSpot;

  const RouteBody({
    Key? key,
    required this.destinationSpot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call SizeConfig on your starting page
    SizeConfig().init(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: Svg('assets/images/app_images/map_illustration.svg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.linearToSrgbGamma(),
        ),
      ),
      child: CustomTimeline(
        timelineContents: <TimelineContent>[
          ...List.generate(
            (destinationSpot.stopBySpots != null)
                ? destinationSpot.stopBySpots!.length
                : 0,
            (index) => TimelineContent(
              contentSide: stopBySpotCardSideDecider(
                destinationSpot.stopBySpots![index].spotType,
              ),
              child: StopBySpotCard(
                heroTag: 'stopBySpot_$index',
                stopBySpot: destinationSpot.stopBySpots![index],
                spotButtonSide: spotButtonSideDecider(
                  stopBySpotCardSideDecider(
                    destinationSpot.stopBySpots![index].spotType,
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
