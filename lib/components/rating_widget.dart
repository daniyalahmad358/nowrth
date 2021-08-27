import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:nowrth/constants.dart';

class CustomRatingStars implements RatingWidget {
  final Color? starColor;
  const CustomRatingStars({
    Key? key,
    this.starColor,
  });

  Color? getStarColor() {
    return (starColor == null) ? kPrimaryColor : starColor;
  }

  @override
  Widget get full => Icon(
        Icons.star,
        color: getStarColor(),
      );

  @override
  Widget get half => Icon(
        Icons.star_half,
        color: getStarColor(),
      );

  @override
  Widget get empty => Icon(
        Icons.star_outline,
        color: getStarColor(),
      );
}
