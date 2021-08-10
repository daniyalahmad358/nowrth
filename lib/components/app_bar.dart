import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nowrth/screens/notifications/notifcations_screen.dart';

import 'package:nowrth/constants.dart';
import 'package:nowrth/size_config.dart';

AppBar buildAppBar(
  BuildContext context, {
  double barOpacity = 1.0,
  String title = "",
  bool blurBackground = true,
  bool onNotiPage = false,
}) {
  SizeConfig().init(context);
  return AppBar(
    iconTheme: IconThemeData(
      color: kPrimaryColor,
      size: percentageHeight(3.902),
    ),
    backgroundColor: Colors.white.withOpacity(barOpacity),
    flexibleSpace: ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(/* color: Colors.transparent, */),
      ),
    ),
    elevation: 0,
    toolbarHeight: percentageHeight(9.106),
    /*
    // For dummy navigation drawer menu button
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        color: kIconColor,
      ),
      onPressed: () {
        // drawer
      },
    ),
    */
    title: Text(
      title,
      style: TextStyle(color: kTextColor, fontSize: percentageHeight(3.25)),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        icon: Icon(
          onNotiPage ? Icons.notifications : Icons.notifications_outlined,
        ),
        // iconSize: Pe,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotificationsScreen(),
            ),
          );
        },
      ),
      IconButton(
        icon: ClipOval(child: Image.asset("assets/images/profile.png")),
        onPressed: () {},
      )
    ],
  );
}
