import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nowrth/constants/app_pages.dart';
import 'package:nowrth/screens/in_app_notifications/in_app_notifcations_screen.dart';

import 'package:nowrth/constants/app_colors.dart';
import 'package:nowrth/constants/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final double barOpacity;
  final String titleText;
  final AppPage atPage;

  const CustomAppBar(
    this.context, {
    required this.atPage,
    Key? key,
    this.barOpacity = 0.9,
    this.titleText = '',
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AppBar(
      shadowColor: kPrimaryColor.withOpacity(0.25),
      elevation: 5,
      toolbarHeight: percentageHeight(9),
      centerTitle: true,
      // backgroundColor: Colors.white.withOpacity(barOpacity),
      iconTheme: IconThemeData(
        color: kPrimaryColor,
        size: percentageHeight(3.902),
      ),
      backgroundColor: kPrimaryLightColor.withOpacity(barOpacity),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(/* color: Colors.transparent, */),
        ),
      ),
      title: Text(
        titleText,
        style: TextStyle(color: kTextColor, fontSize: percentageHeight(3.25)),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            (atPage == AppPage.notifications)
                ? Icons.notifications
                : Icons.notifications_outlined,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InAppNotificationsScreen(),
              ),
            );
          },
        ),
        IconButton(
          icon: ClipOval(child: Image.asset('assets/images/profile.png')),
          onPressed: () {},
        )
      ],
    );
  }
}
