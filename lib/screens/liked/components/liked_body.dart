import 'package:flutter/material.dart';

import 'package:nowrth/constants/size_config.dart';

import 'package:nowrth/components/spot_card/spot_card.dart';
import 'package:nowrth/components/spot_card/tr_corner_widget.dart';

import 'package:nowrth/temp/user_data.dart';

// Has to be stateful
class LikedBody extends StatefulWidget {
  const LikedBody({Key? key}) : super(key: key);

  SpotCard makeLikedSpotCard(int index) {
    SpotCard spotCard = SpotCard(
      spot: likedSpots[index],
      topRightCornerIconData: Icons.close_rounded,
      isFullCard: true,
    );
    return spotCard;
  }

  @override
  _LikedBodyState createState() => _LikedBodyState();
}

class _LikedBodyState extends State<LikedBody> {
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
                mainWidget: widget.makeLikedSpotCard(index),
                cornerIconButton: closeIconButton(index),
              ),
            )
          : TRCornerWidget(
              mainWidget: widget.makeLikedSpotCard(index),
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
