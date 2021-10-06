import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingStars implements RatingWidget {
  final Color? starColor;
  const CustomRatingStars({
    Key? key,
    this.starColor,
  });

  @override
  Widget get full => const Icon(
        Icons.star,
      );

  @override
  Widget get half => const Icon(
        Icons.star_half,
      );

  @override
  Widget get empty => const Icon(
        Icons.star_outline,
      );
}
