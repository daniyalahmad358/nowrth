import 'package:flutter/material.dart';
import 'package:nowrth/constants/app_shadows.dart';

import 'package:nowrth/constants/app_paddings.dart';
import 'package:nowrth/constants/size_config.dart';

import 'package:nowrth/models/spot.dart';
import 'package:nowrth/models/guide.dart';
import 'package:nowrth/screens/details/details_screen.dart';

class SpotCard extends StatefulWidget {
  const SpotCard({
    Key? key,
    required this.spot,
    this.isFullCard = false,
  }) : super(key: key);

  final Spot spot;

  final bool isFullCard;

  @override
  _SpotCardState createState() => _SpotCardState();
}

class _SpotCardState extends State<SpotCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        width: percentageWidth(widget.isFullCard ? 38.165 : 33.09),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          boxShadow: [kDefualtShadow],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: widget.isFullCard ? 1.09 : 1.29,
              child: Image(
                image: widget.spot.images[0].image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: percentageWidth(widget.isFullCard ? 38.165 : 33.09),
              padding: EdgeInsets.all(
                getProportionateScreenWidth(kDefaultPadding),
              ),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: widget.isFullCard
                        ? getProportionateScreenHeight(50)
                        : getProportionateScreenHeight(36),
                    child: Text(
                      widget.spot.spotName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: widget.isFullCard
                            ? getProportionateScreenHeight(17)
                            : getProportionateScreenHeight(12),
                      ),
                    ),
                  ),
                  const VerticalSpacing(of: 10),
                  if (widget.spot.guides != null)
                    GuidesInCard(
                      guides: widget.spot.guides!,
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
              return DetailsScreen(spot: widget.spot);
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
