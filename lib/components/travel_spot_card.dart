import 'package:flutter/material.dart';

import 'package:nowrth/constants.dart';
import 'package:nowrth/size_config.dart';

import 'package:nowrth/models/travel_spot.dart';
import 'package:nowrth/models/guide.dart';
import 'package:nowrth/screens/details/details_screen.dart';

class TravelSpotCard extends StatefulWidget {
  const TravelSpotCard({
    Key? key,
    required this.travelSpot,
    this.isFullCard = false,
    required this.likeControl,
    this.unLike,
  }) : super(key: key);

  final TravelSpot travelSpot;
  final bool isFullCard;
  final GestureTapCallback likeControl;

  final Function()? unLike;

  @override
  _TravelSpotCardState createState() => _TravelSpotCardState();
}

class _TravelSpotCardState extends State<TravelSpotCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: percentageWidth(widget.isFullCard ? 38.165 : 33.09),
        child: Column(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: widget.isFullCard ? 1.09 : 1.29,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.travelSpot.images[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                if (widget.isFullCard)
                  Positioned(
                    right: 0.0,
                    top: 0.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                      ),
                      color: Colors.white,
                      iconSize: percentageHeight(3.90244),
                      splashRadius: percentageHeight(3.4146),
                      onPressed: () {
                        setState(() {
                          widget.travelSpot.isLiked = false;
                          likedTravelSpots.remove(widget.travelSpot);
                          widget.unLike!();
                        });
                      },
                    ),
                  ),
              ],
            ),
            Container(
              width: percentageWidth(widget.isFullCard ? 38.165 : 33.09),
              padding: EdgeInsets.all(
                getProportionateScreenWidth(kDefaultPadding),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [kDefualtShadow],
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    widget.travelSpot.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: widget.isFullCard
                          ? getProportionateScreenHeight(17)
                          : getProportionateScreenHeight(12),
                    ),
                  ),
                  VerticalSpacing(of: 10),
                  Guides(
                    guides: widget.travelSpot.guides,
                    isCardSizeFull: widget.isFullCard,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return Details(travelSpot: widget.travelSpot);
            },
          ),
        );
      },
    );
  }
}

class Guides extends StatelessWidget {
  const Guides({
    Key? key,
    required this.guides,
    this.isCardSizeFull = false,
  }) : super(key: key);

  final bool isCardSizeFull;
  final List<Guide> guides;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: percentageWidth(6.762),
      child: Stack(
        children: [
          ...List.generate(
            isCardSizeFull ? 5 : 4,
            (index) {
              // totalGuide++;
              return Positioned(
                left: isCardSizeFull
                    ? (percentageWidth(5) * index).toDouble()
                    : (percentageWidth(5) * index).toDouble(),
                child: buildGuideFace(index),
              );
            },
          ),
        ],
      ),
    );
  }

  ClipOval buildGuideFace(int index) {
    return ClipOval(
      child: Image.asset(
        guides[index].image,
        height: percentageWidth(6.762),
        width: percentageWidth(6.762),
        fit: BoxFit.cover,
      ),
    );
  }
}
