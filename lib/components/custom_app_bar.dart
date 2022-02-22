import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nowrth/global/app_shadows.dart';
import 'package:nowrth/models/enums/app_pages.dart';
import 'package:nowrth/global/size_config.dart';
import 'package:nowrth/utils/cus_navigator.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double barOpacity;
  final String titleText;
  final AppPage currentPage;

  const CustomAppBar({
    required this.currentPage,
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
      backgroundColor: Theme.of(context)
          .appBarTheme
          .backgroundColor!
          .withOpacity(barOpacity),
      shadowColor: kDefaultShadow.color.withOpacity(0.25),
      elevation: 5,
      toolbarHeight: percentageHeight(9),
      centerTitle: true,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(/* color: Colors.transparent, */),
        ),
      ),
      title: Text(
        titleText,
        style: TextStyle(fontSize: percentageHeight(3.25)),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            (currentPage == AppPage.inAppNotifications)
                ? Icons.notifications
                : Icons.notifications_outlined,
          ),
          onPressed: () {
            if (currentPage != AppPage.inAppNotifications) {
              CusNavigator.pushNamed(
                context,
                AppPage.inAppNotifications.name,
              );
            }
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
