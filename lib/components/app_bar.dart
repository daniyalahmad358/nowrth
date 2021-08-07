import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nowrth/screens/notifications/notifcations_screen.dart';

import '../constants.dart';

AppBar buildAppBar(
  BuildContext context, {
  double barOpacity = 1.0,
  String title = "",
  bool onNotiPage = false,
}) {
  return AppBar(
    iconTheme: IconThemeData(color: kPrimaryColor),
    backgroundColor: Colors.white.withOpacity(barOpacity),
    flexibleSpace: ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
            // color: Colors.transparent,
            ),
      ),
    ),
    elevation: 0,
    /* 
    // For dummy navigation drawer menu button
    // leading: IconButton(
    // icon: Icon(
    // Icons.menu,
    // color: kIconColor,
    // ),
    // onPressed: () {
    // drawer
    // },
    // ),
    */
    title: Text(
      title,
      style: TextStyle(color: kTextColor),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        icon: Icon(
          onNotiPage ? Icons.notifications : Icons.notifications_outlined,
        ),
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
