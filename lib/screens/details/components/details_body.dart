import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nowrth/components/custom_rating_stars.dart';

import 'package:nowrth/constants/app_colors.dart';
import 'package:nowrth/constants/size_config.dart';

import 'package:nowrth/models/classes/spot.dart';
import 'package:nowrth/temp/user_data.dart';

// Has to be stateful

class DetailsBody extends StatelessWidget {
  final Spot spot;

  const DetailsBody({
    Key? key,
    required this.spot,
  }) : super(key: key);

  void likeSpot() {
    likedSpots.add(spot);
  }

  void dislikeSpot() {
    likedSpots.remove(spot);
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();
    // You have to call SizeConfig on your starting page
    SizeConfig().init(context);
    return ListView(
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _controller,
          padding: const EdgeInsets.symmetric(horizontal: 4.75),
          child: Row(
            children: <Widget>[
              ...List.generate(
                spot.images.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4.75,
                  ),
                  child: Container(
                    width: (SizeConfig.screenWidth < SizeConfig.screenHeight)
                        ? percentageWidth(95)
                        : 450,
                    height: (SizeConfig.screenWidth < SizeConfig.screenHeight)
                        ? SizeConfig.screenWidth / 1.5
                        : percentageWidth(33) / 1.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: spot.images[index].image,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: percentageHeight(3.252)),
        ListView(
          padding: EdgeInsets.symmetric(horizontal: percentageHeight(3.252)),
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    spot.spotName,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: percentageHeight(3.252),
                      color: kTextColor,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                ),
                StatefulBuilder(
                  builder: (
                    BuildContext context,
                    void Function(void Function()) setIconState,
                  ) {
                    return IconButton(
                      icon: Icon(
                        (likedSpots.contains(spot))
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {
                        setIconState(() {
                          (likedSpots.contains(spot))
                              ? dislikeSpot()
                              : likeSpot();
                        });
                      },
                    );
                  },
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: percentageHeight(2.34),
                  color: Colors.blueGrey[300],
                ),
                SizedBox(width: percentageHeight(0.488)),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    spot.address.fullLocation,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: percentageHeight(2.1138),
                      color: Colors.blueGrey[300],
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            SizedBox(height: percentageHeight(3.252)),
            Container(
              alignment: Alignment.centerLeft,
              child: RatingBar(
                itemSize: percentageHeight(3.252),
                allowHalfRating: true,
                ratingWidget: const CustomRatingStars(),
                initialRating: spot.rating,
                ignoreGestures: true,
                onRatingUpdate: (rating) {},
              ),
            ),
            SizedBox(height: percentageHeight(6.5041)),
            if (spot.description != null)
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'More About ${spot.spotName}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: percentageHeight(2.602),
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
            SizedBox(height: percentageHeight(1.626)),
            if (spot.description != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  spot.description!,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: percentageHeight(2.439),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            SizedBox(height: percentageHeight(1.626)),
          ],
        ),
      ],
    );
  }
}
