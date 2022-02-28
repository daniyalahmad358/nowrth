import 'package:flutter/material.dart';
import 'package:nowrth/global/size_config.dart'; // TODO: When server is up

Future<dynamic> customShowDialog(BuildContext context,
    {required String title,
    required String description,
    required List<Widget> actions}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      buttonPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(
          fontSize: percentageHeight(2.4),
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Text(
        description,
        style: TextStyle(
          fontSize: percentageHeight(2.1),
        ),
      ),
      actions: actions,
    ),
  );
}
