import 'package:flutter/material.dart';

import 'package:nowrth/constants.dart';
import 'package:nowrth/size_config.dart';

import 'package:nowrth/models/TravelSpot.dart';
import 'package:nowrth/models/Guide.dart';
import 'package:nowrth/screens/details/details_screen.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    Key key,
    @required this.travelSpot,
    this.isFullCard = false,
    @required this.press,
  }) : super(key: key);

  final TravelSpot travelSpot;
  final bool isFullCard;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: SizedBox(
        width: percentageWidth(isFullCard ? 38.165 : 33.09),
        child: Column(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: isFullCard ? 1.09 : 1.29,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage(travelSpot.images[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                if (isFullCard)
                  Positioned(
                    right: 0.0,
                    top: 0.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                      ),
                      color: Colors.white,
                      iconSize: percentageHeight(4.065),
                      splashRadius: 21,
                      onPressed: () {},
                    ),
                  ),
              ],
            ),
            Container(
              width: percentageWidth(isFullCard ? 38.165 : 33.09),
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
                    travelSpot.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: isFullCard
                          ? getProportionateScreenHeight(17)
                          : getProportionateScreenHeight(12),
                    ),
                  ),
                  VerticalSpacing(of: 10),
                  Guides(
                    guides: travelSpot.guides,
                    isCardSizeFull: isFullCard,
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
              return Details(travelSpot: travelSpot);
            },
          ),
        );
      },
    );
  }
}

class Guides extends StatelessWidget {
  const Guides({
    Key key,
    @required this.guides,
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
          // Positioned(
          //   left: (percentageWidth(5) * totalGuide).toDouble(),
          //   child: Container(
          //     height: percentageWidth(6.762),
          //     width: percentageWidth(6.762),
          //     decoration: BoxDecoration(
          //       color: kPrimaryColor,
          //       shape: BoxShape.circle,
          //     ),
          //     child: Icon(Icons.add, color: Colors.white),
          //   ),
          // )
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
