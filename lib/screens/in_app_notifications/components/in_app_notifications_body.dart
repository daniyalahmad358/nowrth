import 'package:flutter/material.dart';
import 'package:nowrth/screens/in_app_notifications/components/in_app_notification_card.dart';
import 'package:nowrth/constants/size_config.dart';

import 'package:nowrth/temp/in_app_notifications.dart';

class InAppNotificationsBody extends StatelessWidget {
  final notiBorderRadius = BorderRadius.circular(percentageHeight(1.5));

  InAppNotificationsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView(
      children: <Widget>[
        ...List.generate(
          inAppNotifications.length,
          (index) => Padding(
            padding: EdgeInsets.symmetric(
              vertical: percentageHeight(0.3),
              horizontal: percentageWidth(2),
            ),
            child: InkWell(
              borderRadius: notiBorderRadius,
              child: InAppNotificationCard(
                inAppNotification: inAppNotifications[index],
                press: () {},
                notiBorderRadius: notiBorderRadius,
              ),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
