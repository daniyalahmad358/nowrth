import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:nowrth/models/notification_model.dart';
import 'package:nowrth/size_config.dart';

import 'package:nowrth/constants.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    required this.theNotification,
    required this.press,
    required this.notiBorderRadius,
  }) : super(key: key);

  final NotificationModel theNotification;
  final GestureTapCallback press;
  final BorderRadius notiBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight / 12,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow:
            theNotification.readStatus ? [kDefualtShadow] : [kUnreadShadow],
        borderRadius: notiBorderRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Icon(
              theNotification.iconData,
              color: theNotification.readStatus ? kIconColor : kPrimaryColor,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              theNotification.headline,
              style: TextStyle(
                color: theNotification.readStatus ? kIconColor : kPrimaryColor,
                fontSize: percentageHeight(2.2764),
                fontWeight: theNotification.readStatus
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
                  DateFormat.Hm().format(theNotification.dateTime),
                  style: TextStyle(fontSize: SizeConfig.screenHeight / 60),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
