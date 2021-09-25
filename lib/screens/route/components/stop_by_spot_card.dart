import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:nowrth/constants/app_colors.dart';
import 'package:nowrth/constants/app_shadows.dart';
import 'package:nowrth/constants/size_config.dart';

import 'package:nowrth/models/classes/spot.dart';

import 'package:nowrth/components/custom_rating_stars.dart';
import 'package:nowrth/screens/details/details_screen.dart';

import 'package:nowrth/screens/route/components/enums/sides.dart';

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

  @override
  _StopBySpotCardState createState() => _StopBySpotCardState();
}

class _StopBySpotCardState extends State<StopBySpotCard> {
  bool isInfoShown = false;
  void infoShowHide() {
    setState(() {
      isInfoShown = !isInfoShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(spot: widget.stopBySpot),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isInfoShown ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                boxShadow: isInfoShown ? [kDefualtShadow] : null,
                border: isInfoShown
                    ? Border.all(color: Colors.blueGrey[100]!)
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: (widget.spotButtonSide == Side.left)
                        ? percentageHeight(8)
                        : null,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.stopBySpot.spotTypeDesiplayText!,
                        style: TextStyle(
                          color: isInfoShown ? null : Colors.transparent,
                          fontSize: percentageHeight(2),
                        ),
                      ),
                      Text(
                        widget.stopBySpot.address.cityOrTown,
                        style: TextStyle(
                          color: isInfoShown ? null : Colors.transparent,
                          fontSize: percentageHeight(2),
                        ),
                      ),
                      RatingBar(
                        itemSize: percentageHeight(2),
                        allowHalfRating: true,
                        ratingWidget: CustomRatingStars(
                          starColor: isInfoShown ? null : Colors.transparent,
                        ),
                        initialRating: widget.stopBySpot.rating,
                        ignoreGestures: true,
                        onRatingUpdate: (rating) {},
                      ),
                    ],
                  ),
                  SizedBox(
                    width: (widget.spotButtonSide == Side.right)
                        ? percentageHeight(8)
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
              infoShowHide: infoShowHide,
              heroTag: widget.heroTag,
              iconData: widget.stopBySpot.iconData!,
            ),
          ),
        ],
      ),
    );
  }
}

class SpotButton extends StatelessWidget {
  final void Function() infoShowHide;
  final String heroTag;
  final IconData iconData;
  const SpotButton({
    Key? key,
    required this.infoShowHide,
    required this.heroTag,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: percentageHeight(7),
      width: percentageHeight(7),
      margin: const EdgeInsets.symmetric(horizontal: 7),
      // decoration: BoxDecoration(boxShadow: [kDefualtShadow]),
      child: FittedBox(
        child: FloatingActionButton(
          heroTag: heroTag,
          backgroundColor: Colors.white,
          onPressed: infoShowHide,
          child: Icon(
            iconData,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
