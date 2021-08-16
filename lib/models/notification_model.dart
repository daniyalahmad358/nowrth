import 'package:flutter/material.dart';

class NotificationModel {
  final String headline;
  final IconData iconData;
  final DateTime dateTime;
  final bool readStatus;

  NotificationModel({
    required this.headline,
    required this.iconData,
    required this.dateTime,
    required this.readStatus,
  });
}

List<NotificationModel> theNotifications = [
  NotificationModel(
    iconData: Icons.person,
    headline: "Update your profile",
    dateTime: DateTime(2020, 10, 15, 5, 25),
    readStatus: true,
  ),
  NotificationModel(
    headline: "Ali sent you a message",
    iconData: Icons.message,
    dateTime: DateTime(2020, 7, 10, 14, 9),
    readStatus: false,
  ),
  NotificationModel(
    headline: "Ali sent you a message",
    iconData: Icons.message,
    dateTime: DateTime(2020, 7, 9, 21, 36),
    readStatus: true,
  ),
  NotificationModel(
    headline: "Verify your email address",
    iconData: Icons.warning,
    dateTime: DateTime(2020, 5, 15, 7, 8),
    readStatus: true,
  ),
  NotificationModel(
    headline: "Ali sent you a message",
    iconData: Icons.message,
    dateTime: DateTime(2020, 5, 10, 12, 0),
    readStatus: false,
  ),
  NotificationModel(
    headline: "Ali sent you a message",
    iconData: Icons.message,
    dateTime: DateTime(2020, 5, 10, 7, 29),
    readStatus: true,
  ),
  NotificationModel(
    headline: "Ali sent you a message",
    iconData: Icons.message,
    dateTime: DateTime(2020, 3, 7, 9, 24),
    readStatus: true,
  ),
  NotificationModel(
    headline: "Ali sent you a message",
    iconData: Icons.message,
    dateTime: DateTime(2020, 3, 5, 21, 24),
    readStatus: true,
  ),
  NotificationModel(
    headline: "Ali sent you a message",
    iconData: Icons.message,
    dateTime: DateTime(2020, 3, 5, 1, 6),
    readStatus: true,
  ),
  NotificationModel(
    headline: "Ali sent you a message",
    iconData: Icons.message,
    dateTime: DateTime(2020, 3, 2, 4, 56),
    readStatus: true,
  ),
  NotificationModel(
    headline: "Ali sent you a message",
    iconData: Icons.message,
    dateTime: DateTime(2020, 3, 1, 16, 25),
    readStatus: false,
  ),
  NotificationModel(
    headline: "Ali sent you a message",
    iconData: Icons.message,
    dateTime: DateTime(2020, 2, 10, 2, 45),
    readStatus: true,
  ),
  NotificationModel(
    headline: "Ali sent you a message",
    iconData: Icons.message,
    dateTime: DateTime(2020, 2, 4, 7, 1),
    readStatus: false,
  ),
  NotificationModel(
    headline: "Ali sent you a message",
    iconData: Icons.message,
    dateTime: DateTime(2020, 1, 10, 19, 45),
    readStatus: true,
  ),
];
