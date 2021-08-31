import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nowrth/screens/in_app_notifications/in_app_notifcations_screen.dart';

import 'package:nowrth/constants/app_colors.dart';
import 'package:nowrth/constants/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final double barOpacity;
  final String titleText;
  final bool blurBackground;
  final bool onNotiPage;

  CustomAppBar(
    this.context, {
    Key? key,
    this.barOpacity = 1.0,
    this.titleText = "",
    this.blurBackground = true,
    this.onNotiPage = false,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AppBar(
      iconTheme: IconThemeData(
        color: kPrimaryColor,
        size: percentageHeight(3.902),
      ),
      // backgroundColor: Colors.white.withOpacity(barOpacity),
      backgroundColor: kPrimaryLightColor.withOpacity(barOpacity),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(/* color: Colors.transparent, */),
        ),
      ),
      elevation: 0,
      toolbarHeight: percentageHeight(9),
      title: Text(
        titleText,
        style: TextStyle(color: kTextColor, fontSize: percentageHeight(3.25)),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            onNotiPage ? Icons.notifications : Icons.notifications_outlined,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InAppNotificationsScreen(),
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
}
