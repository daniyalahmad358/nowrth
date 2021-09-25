import 'package:flutter/material.dart';
import 'package:nowrth/constants/app_shadows.dart';

import 'package:nowrth/constants/app_paddings.dart';
import 'package:nowrth/constants/size_config.dart';

import 'package:nowrth/models/classes/spot.dart';
import 'package:nowrth/models/classes/guide.dart';
import 'package:nowrth/screens/details/details_screen.dart';

class SpotCard extends StatelessWidget {
  const SpotCard({
    Key? key,
    required this.spot,
    this.isFullCard = false,
  }) : super(key: key);

  final Spot spot;

  final bool isFullCard;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        width: percentageWidth(isFullCard ? 38.165 : 33.09),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          boxShadow: [kDefualtShadow],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: isFullCard ? 1.09 : 1.29,
              child: Image(
                image: spot.images[0].image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: percentageWidth(isFullCard ? 38.165 : 33.09),
              padding: EdgeInsets.all(
                getProportionateScreenWidth(kDefaultPadding),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: isFullCard
                        ? getProportionateScreenHeight(50)
                        : getProportionateScreenHeight(36),
                    child: Text(
                      spot.spotName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: isFullCard
                            ? getProportionateScreenHeight(17)
                            : getProportionateScreenHeight(12),
                      ),
                    ),
                  ),
                  const VerticalSpacing(of: 10),
                  if (spot.guides != null)
                    GuidesInCard(
                      guides: spot.guides!,
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
              return DetailsScreen(spot: spot);
            },
          ),
        );
      },
    );
  }
}

class GuidesInCard extends StatelessWidget {
  const GuidesInCard({
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
        children: <Widget>[
          ...List.generate(
            isCardSizeFull ? 5 : 4,
            (index) {
              // totalGuide++;
              return Positioned(
                left: (percentageWidth(5) * index).toDouble(),
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
