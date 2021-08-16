import 'package:flutter/material.dart';
import 'package:nowrth/screens/notifications/components/notification_card.dart';
import 'package:nowrth/models/notification_model.dart';
import 'package:nowrth/size_config.dart';

class NotificationsBody extends StatelessWidget {
  final notiBorderRadius = BorderRadius.circular(SizeConfig.screenWidth / 34.5);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(
          theNotifications.length,
          (index) => Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.screenHeight / 120,
              horizontal: SizeConfig.screenWidth / 15,
            ),
            child: Container(
              child: InkWell(
                borderRadius: notiBorderRadius,
                child: NotificationCard(
                  theNotification: theNotifications[index],
                  press: () {},
                  notiBorderRadius: notiBorderRadius,
                ),
                onTap: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
