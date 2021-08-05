import 'package:flutter/material.dart';

import '../constants.dart';

AppBar buildAppBar(
  BuildContext context, {
  double barOpacity = 1.0,
  String title = "",
}) {
  return AppBar(
    iconTheme: IconThemeData(color: kIconColor),
    backgroundColor: Colors.white.withOpacity(barOpacity),
    elevation: 0,
    // leading: IconButton(
    // icon: Icon(
    // Icons.menu,
    // color: kIconColor,
    // ),
    // onPressed: () {
    // drawer
    // },
    // ),
    title: Text(
      title,
      style: TextStyle(color: kTextColor),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        icon: ClipOval(child: Image.asset("assets/images/profile.png")),
        onPressed: () {},
      )
    ],
  );
}
