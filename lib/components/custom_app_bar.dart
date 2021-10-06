import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nowrth/global/app_shadows.dart';
import 'package:nowrth/models/enums/app_pages.dart';
import 'package:nowrth/screens/in_app_notifications/in_app_notifcations_screen.dart';

import 'package:nowrth/global/size_config.dart';

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
      shadowColor: kDefualtShadow.color.withOpacity(0.25),
      elevation: 5,
      toolbarHeight: percentageHeight(9),
      centerTitle: true,
      iconTheme: IconThemeData(
        size: percentageHeight(3.902),
      ),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(/* color: Colors.transparent, */),
        ),
      ),
      title: Text(
        titleText,
        style: TextStyle(
          fontSize: percentageHeight(3.25),
        ),
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
          icon: ClipOval(child: Image.asset('assets/images/user_dp/dp.jpg')),
          onPressed: () {},
        )
      ],
    );
  }
}
