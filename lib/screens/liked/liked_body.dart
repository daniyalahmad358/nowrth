import 'package:flutter/material.dart';

import 'package:nowrth/global/size_config.dart';

import 'package:nowrth/components/spot_card/spot_card.dart';
import 'package:nowrth/components/spot_card/tr_corner_widget.dart';

import 'package:nowrth/temp/user_data.dart';

// Has to be stateful
class LikedBody extends StatefulWidget {
  const LikedBody({Key? key}) : super(key: key);

  SpotCard makeLikedSpotCard(int index) {
    SpotCard spotCard = SpotCard(
      spot: likedSpots[index],
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
      icon: const Icon(
        Icons.close_rounded,
      ),
      iconSize: percentageHeight(3.9),
      splashRadius: percentageHeight(3.5),
      alignment: Alignment.topRight,
      padding: const EdgeInsets.all(4),
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
                child: IconTheme(
                  data: Theme.of(context).primaryIconTheme,
                  child: (likedSpots.length == 2)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            likedTravelSpotCards[0],
                            likedTravelSpotCards[1],
                          ],
                        )
                      : Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          runSpacing: 25,
                          children: likedTravelSpotCards,
                        ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
