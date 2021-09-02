import 'package:flutter/widgets.dart';

class InAppNotification {
  final String headline;
  final IconData iconData;
  final DateTime dateTime;
  final bool readStatus;

  InAppNotification({
    required this.headline,
    required this.iconData,
    required this.dateTime,
    required this.readStatus,
  });
}
