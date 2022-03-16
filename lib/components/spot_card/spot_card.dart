import 'package:flutter/material.dart';
import 'package:nowrth/global/app_shadows.dart';

import 'package:nowrth/global/app_paddings.dart';

import 'package:nowrth/models/classes/spot.dart';
import 'package:nowrth/models/classes/guide.dart';
import 'package:nowrth/screens/details/details_screen.dart';
import 'package:nowrth/utils/cus_navigator.dart';

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
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        width: isFullCard ? 115 : 100,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [kDefaultShadow],
          borderRadius: BorderRadius.circular(10),
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
              width: isFullCard ? 115 : 100,
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: isFullCard ? 50 : 36,
                    child: Text(
                      spot.spotName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: isFullCard ? 17 : 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
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
        CusNavigator.push(
          context,
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
      height: 20,
      child: Stack(
        children: <Widget>[
          ...List.generate(
            isCardSizeFull ? 5 : 4,
            (index) {
              // totalGuide++;
              return Positioned(
                left: (15 * index).toDouble(),
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
        height: 20,
        width: 20,
        fit: BoxFit.cover,
      ),
    );
  }
}
