import 'package:flutter/material.dart';

// const kPrimaryColor = Color(0xFF4DB6AC);
const kPrimaryColor = Color(0xFF3E4067);
const kTextColor = Color(0xFF3F4168);
const kIconColor = Color(0xFF5E5E5E);
// const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

const kSecondaryColor = Colors.white;

const kDefaultPadding = 16.67;

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
