import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:nowrth/constants.dart';

RatingWidget customRatingStars = RatingWidget(
  full: Icon(
    Icons.star,
    color: kPrimaryColor,
  ),
  half: Icon(
    Icons.star_half,
    color: kPrimaryColor,
  ),
  empty: Icon(
    Icons.star_outline,
    color: kTextColor,
  ),
);
