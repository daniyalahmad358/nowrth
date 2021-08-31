import 'package:flutter/material.dart';
import 'package:nowrth/constants/app_colors.dart';

final kDefualtShadow = BoxShadow(
  offset: Offset(5, 5),
  blurRadius: 10,
  color: Color(0xFFE9E9E9).withOpacity(0.56),
);

final kUnreadShadow = BoxShadow(
  offset: Offset(5, 5),
  blurRadius: 10,
  color: kPrimaryColor.withOpacity(0.4),
);
