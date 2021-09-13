import 'package:flutter/material.dart';

import 'package:nowrth/constants/size_config.dart';

import 'package:nowrth/components/spot_card/spot_card.dart';
import 'package:nowrth/components/spot_card/tr_corner_widget.dart';
import 'package:nowrth/screens/contribution/contributions/components/options_menu.dart';

import 'package:nowrth/temp/user_data.dart';

// Has to be stateful
class ContributionsBody extends StatefulWidget {
  @override
  _ContributionsBodyState createState() => _ContributionsBodyState();
}

class _ContributionsBodyState extends State<ContributionsBody> {
  SpotCard makeContributedSpotCard(int index) {
    SpotCard spotCard = SpotCard(
      spot: contributedSpots[index],
      isFullCard: true,
    );
    return spotCard;
  }

  IconButton optionsIconButton(index) {
    return IconButton(
      icon: Icon(
        Icons.more_horiz,
      ),
      color: Colors.white,
      iconSize: percentageHeight(4),
      splashRadius: percentageHeight(3.5),
      padding: EdgeInsets.all(2),
      alignment: Alignment.topCenter,
      onPressed: () => OptionsMenu.showMenu(
        context,
        contributedSpot: contributedSpots[index],
        spotToEdit: contributedSpots[index],
        refresher: () {
          setState(() {});
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> contributedSpotCards = List.generate(
      contributedSpots.length,
      (index) => (contributedSpots.length == 1)
          ? Align(
              alignment: Alignment.topLeft,
              child: TRCornerWidget(
                mainWidget: makeContributedSpotCard(index),
                cornerIconButton: optionsIconButton(index),
              ),
            )
          : TRCornerWidget(
              mainWidget: makeContributedSpotCard(index),
              cornerIconButton: optionsIconButton(index),
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
                    if (contributedSpots.length == 2) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(child: contributedSpotCards[0]),
                          Container(child: contributedSpotCards[1]),
                        ],
                      );
                    }

                    return Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      runSpacing: 25,
                      children: contributedSpotCards,
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
