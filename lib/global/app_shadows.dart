import 'package:flutter/material.dart';
import 'package:nowrth/global/app_theme.dart';

final kDefaultShadow = BoxShadow(
  offset: const Offset(5, 5),
  blurRadius: 10,
  color: AppTheme.currentTheme.shadowColor,
);

final kBottomNavBarOuterShadow = BoxShadow(
  offset: const Offset(0, -5),
  blurRadius: 10,
  color: AppTheme.currentTheme.shadowColor,
);
final kBottomNavBarInnerShadow = BoxShadow(
  blurRadius: 10,
  color: AppTheme.currentTheme.shadowColor,
);

final kAppBarShadow = BoxShadow(
  offset: const Offset(0, 5),
  blurRadius: 10,
  color: AppTheme.currentTheme.shadowColor.withOpacity(1.0),
);

const kUnreadShadow = BoxShadow(
  offset: Offset(5, 5),
  blurRadius: 10,
  // color: kPrimaryColor.withOpacity(0.4),
);

final Shadow homeHeadline6Shadow = Shadow(
  color: Colors.grey[900]!,
  offset: const Offset(2, 2),
  blurRadius: 2,
);
