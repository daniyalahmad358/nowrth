import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:nowrth/global/app_shadows.dart';
import 'package:nowrth/global/size_config.dart';

import 'package:nowrth/models/classes/spot.dart';

import 'package:nowrth/components/custom_rating_stars.dart';
import 'package:nowrth/screens/details/details_screen.dart';

import 'package:nowrth/screens/route/components/enums/sides.dart';
import 'package:nowrth/utils/cus_navigator.dart';

class StopBySpotCard extends StatefulWidget {
  final Spot stopBySpot;
  final String heroTag;
  final Side spotButtonSide;

  const StopBySpotCard({
    Key? key,
    required this.stopBySpot,
    required this.heroTag,
    required this.spotButtonSide,
  }) : super(key: key);

  void moveToDetails(BuildContext context, widget) {
    CusNavigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(spot: widget.stopBySpot),
      ),
    );
  }

  @override
  _StopBySpotCardState createState() => _StopBySpotCardState();
}

class _StopBySpotCardState extends State<StopBySpotCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: () {
              widget.moveToDetails(context, widget);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [kDefaultShadow],
                border: Border.all(color: Colors.blueGrey[100]!),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: (widget.spotButtonSide == Side.left)
                        ? percentageHeight(6)
                        : null,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.stopBySpot.spotTypeDisplayText!,
                        style: TextStyle(
                          fontSize: percentageHeight(2),
                        ),
                      ),
                      Text(
                        widget.stopBySpot.address.cityOrTown,
                        style: TextStyle(
                          fontSize: percentageHeight(2),
                        ),
                      ),
                      RatingBar(
                        itemSize: percentageHeight(2),
                        allowHalfRating: true,
                        ratingWidget: const CustomRatingStars(),
                        initialRating: widget.stopBySpot.rating,
                        ignoreGestures: true,
                        onRatingUpdate: (rating) {},
                      ),
                    ],
                  ),
                  SizedBox(
                    width: (widget.spotButtonSide == Side.right)
                        ? percentageHeight(6)
                        : null,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: double.minPositive,
            top: double.minPositive,
            left: (widget.spotButtonSide == Side.left) ? 0.0 : null,
            right: (widget.spotButtonSide == Side.right) ? 0.0 : null,
            child: SpotButton(
              heroTag: widget.heroTag,
              iconData: widget.stopBySpot.iconData!,
              press: () {
                widget.moveToDetails(context, widget);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SpotButton extends StatelessWidget {
  // final void Function() infoShowHide;
  final String heroTag;
  final IconData iconData;
  final Function press;

  const SpotButton({
    Key? key,
    required this.heroTag,
    required this.iconData,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: percentageHeight(6),
      width: percentageHeight(6),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      // decoration: BoxDecoration(boxShadow: [kDefaultShadow]),
      child: FittedBox(
        child: FloatingActionButton(
          heroTag: heroTag,
          onPressed: () {
            press();
          },
          child: Icon(
            iconData,
          ),
        ),
      ),
    );
  }
}
