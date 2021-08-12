import 'package:flutter/material.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'package:nowrth/constants.dart';
import 'package:nowrth/size_config.dart';

import 'package:nowrth/models/TravelSpot.dart';
// import 'package:nowrth/utils/places.dart';

// import 'home_header.dart';
// import 'popular_places.dart';
// import 'top_guides.dart';

class Body extends StatelessWidget {
  Body({
    @required this.travelSpot,
  });

  final TravelSpot travelSpot;

  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    // You have to call SizeConfig on your starting page
    SizeConfig().init(context);
    return ListView(
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _controller,
          padding: EdgeInsets.symmetric(horizontal: 4.75),
          child: Row(
            children: <Widget>[
              ...List.generate(
                travelSpot.images.length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(
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
                        fit: BoxFit.fill,
                        image: AssetImage(
                          travelSpot.images[index],
                        ),
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
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    travelSpot.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: percentageHeight(3.252),
                      color: kTextColor,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {},
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
                    travelSpot.location,
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
              child: SmoothStarRating(
                starCount: 5,
                rating: travelSpot.rating,
                size: percentageHeight(3.252),
                isReadOnly: true,
                color: kPrimaryColor,
                borderColor: kPrimaryColor,
              ),
            ),
            SizedBox(height: percentageHeight(6.5041)),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: percentageHeight(2.602),
                ),
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: percentageHeight(1.626)),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                travelSpot.details,
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
