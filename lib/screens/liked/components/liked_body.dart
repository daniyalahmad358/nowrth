import 'package:flutter/material.dart';

import 'package:nowrth/size_config.dart';

import 'package:nowrth/models/travel_spot.dart';
import 'package:nowrth/components/travel_spot_card.dart';

// Has to be stateful
class LikedBody extends StatefulWidget {
  @override
  _LikedBodyState createState() => _LikedBodyState();
}

class _LikedBodyState extends State<LikedBody> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                    TravelSpotCard makeLikedTravelSpotCard(int index) {
                      TravelSpotCard travelSpotCard = TravelSpotCard(
                        travelSpot: likedTravelSpots[index],
                        isFullCard: true,
                        unLike: refresh,
                      );
                      return travelSpotCard;
                    }

                    List<Widget> likedTravelSpotCards = List.generate(
                      likedTravelSpots.length,
                      (index) => ((likedTravelSpots.length == 1)
                          ? Align(
                              alignment: Alignment.topLeft,
                              child: makeLikedTravelSpotCard(index),
                            )
                          : makeLikedTravelSpotCard(index)),
                    );

                    if (likedTravelSpots.length == 2) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(child: likedTravelSpotCards[0]),
                          Container(child: likedTravelSpotCards[1]),
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
