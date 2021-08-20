import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:nowrth/constants.dart';
import 'package:nowrth/size_config.dart';
import 'package:nowrth/models/stop_by_spot.dart';

import 'package:nowrth/components/rating_widget.dart';

class StopBySpotCard extends StatefulWidget {
  const StopBySpotCard({
    Key? key,
    required this.stopBySpot,
  }) : super(key: key);

  final StopBySpot stopBySpot;

  @override
  _StopBySpotCardState createState() => _StopBySpotCardState();
}

class _StopBySpotCardState extends State<StopBySpotCard> {
  bool showInfo = false;
  Container spotButton() {
    return Container(
      height: percentageHeight(8.13),
      width: percentageHeight(8.13),
      margin: EdgeInsets.only(left: 10),
      // decoration: BoxDecoration(boxShadow: [kDefualtShadow]),
      child: FittedBox(
        child: GestureDetector(
          onLongPress: () {
            setState(() {
              showInfo = true;
            });
          },
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {},
            child: Icon(
              widget.stopBySpot.iconData,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      child: Stack(
        children: <Widget>[
          if (showInfo)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [kDefualtShadow],
                border: Border.all(),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: percentageHeight(9.75),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.stopBySpot.name),
                      Text(widget.stopBySpot.stopType),
                      RatingBar(
                        itemSize: percentageHeight(2.5),
                        allowHalfRating: true,
                        ratingWidget: customRatingStars,
                        initialRating: widget.stopBySpot.rating,
                        ignoreGestures: true,
                        onRatingUpdate: (rating) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          showInfo
              ? Positioned(
                  bottom: double.minPositive,
                  top: double.minPositive,
                  left: 0.0,
                  child: spotButton(),
                )
              : spotButton(),
        ],
      ),
    );
  }
}
