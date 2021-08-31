import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nowrth/components/rating_widget.dart';

import 'package:nowrth/constants/app_colors.dart';
import 'package:nowrth/constants/size_config.dart';

import 'package:nowrth/models/travel_spot.dart';
import 'package:nowrth/temp/user_data.dart';

// Has to be stateful
class DetailsBody extends StatefulWidget {
  DetailsBody({
    required this.travelSpot,
  });

  final TravelSpot travelSpot;

  @override
  _DetailsBodyState createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  final _controller = ScrollController();
  void likeTravelSpot() {
    // widget.travelSpot.isLiked = true;
    likedSpots.add(widget.travelSpot);
  }

  void dislikeTravelSpot() {
    // widget.travelSpot.isLiked = false;
    likedSpots.remove(widget.travelSpot);
  }

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
                widget.travelSpot.images.length,
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
                          widget.travelSpot.images[index],
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
        Container(
          child: ListView(
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
                      widget.travelSpot.name,
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
                      (likedSpots.contains(widget.travelSpot))
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: kPrimaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        (likedSpots.contains(widget.travelSpot))
                            ? dislikeTravelSpot()
                            : likeTravelSpot();
                      });
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
                      widget.travelSpot.location,
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
                  ratingWidget: CustomRatingStars(),
                  initialRating: widget.travelSpot.rating,
                  ignoreGestures: true,
                  onRatingUpdate: (rating) {},
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
                  widget.travelSpot.details,
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
        ),
      ],
    );
  }
}
