import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:nowrth/global/app_shadows.dart';
import 'package:nowrth/models/classes/in_app_notification.dart';
import 'package:nowrth/global/size_config.dart';

class InAppNotificationCard extends StatelessWidget {
  const InAppNotificationCard({
    Key? key,
    required this.inAppNotification,
    required this.press,
    required this.notiBorderRadius,
  }) : super(key: key);

  final InAppNotification inAppNotification;
  final GestureTapCallback press;
  final BorderRadius notiBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight / 12,
      decoration: BoxDecoration(
        boxShadow: [kDefaultShadow],
        borderRadius: notiBorderRadius,
      ),
      child: Card(
        borderOnForeground: false,
        shape: RoundedRectangleBorder(borderRadius: notiBorderRadius),
        elevation: 0.7,
        margin: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Icon(
                inAppNotification.iconData,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                inAppNotification.headline,
                style: TextStyle(
                  fontSize: percentageHeight(2.2764),
                  fontWeight: inAppNotification.readStatus
                      ? FontWeight.normal
                      : FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.screenWidth / 43),
                  child: Text(
                    DateFormat.Hm().format(inAppNotification.dateTime),
                    style: TextStyle(fontSize: SizeConfig.screenHeight / 60),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
