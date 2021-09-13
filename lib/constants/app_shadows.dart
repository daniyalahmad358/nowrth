import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nowrth/constants/app_colors.dart';

final kDefualtShadow = BoxShadow(
  offset: const Offset(5, 5),
  blurRadius: 10,
  color: const Color(0xFFE9E9E9).withOpacity(0.56),
);

final kBottomNavBarShadow = BoxShadow(
  offset: const Offset(0, -5),
  blurRadius: 10,
  color: kPrimaryColor.withOpacity(0.25),
);

final kAppBarShadow = BoxShadow(
  offset: const Offset(0, 5),
  blurRadius: 10,
  color: kPrimaryColor.withOpacity(0.25),
);

final kUnreadShadow = BoxShadow(
  offset: const Offset(5, 5),
  blurRadius: 10,
  color: kPrimaryColor.withOpacity(0.4),
);
