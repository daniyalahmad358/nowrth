import 'package:flutter/material.dart';

import 'package:nowrth/constants/size_config.dart';

import 'package:nowrth/components/travel_spot_card/travel_spot_card.dart';
import 'package:nowrth/components/travel_spot_card/tr_corner_widget.dart';

import 'package:nowrth/temp/user_data.dart';

// Has to be stateful
class LikedBody extends StatefulWidget {
  @override
  _LikedBodyState createState() => _LikedBodyState();
}

class _LikedBodyState extends State<LikedBody> {
  TravelSpotCard makeLikedTravelSpotCard(int index) {
    TravelSpotCard travelSpotCard = TravelSpotCard(
      travelSpot: likedSpots[index],
      topRightCornerIconData: Icons.close_rounded,
      isFullCard: true,
    );
    return travelSpotCard;
  }

  IconButton closeIconButton(index) {
    return IconButton(
      icon: Icon(
        Icons.close_rounded,
      ),
      color: Colors.white,
      iconSize: percentageHeight(4),
      splashRadius: percentageHeight(3.5),
      onPressed: () {
        likedSpots.remove(likedSpots[index]);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> likedTravelSpotCards = List.generate(
      likedSpots.length,
      (index) => (likedSpots.length == 1)
          ? Align(
              alignment: Alignment.topLeft,
              child: TRCornerWidget(
                mainWidget: makeLikedTravelSpotCard(index),
                cornerIconButton: closeIconButton(index),
              ),
            )
          : TRCornerWidget(
              mainWidget: makeLikedTravelSpotCard(index),
              cornerIconButton: closeIconButton(index),
            ),
    );

    return ListView(
      children: <Widget>[
        SizedBox(
          width: SizeConfig.screenWidth,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20.83)),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: percentageHeight(1.62)),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (likedSpots.length == 2) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          likedTravelSpotCards[0],
                          likedTravelSpotCards[1],
                        ],
                      );
                    }

                    return Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      runSpacing: 25,
                      children: likedTravelSpotCards,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
