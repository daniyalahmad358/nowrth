import 'package:flutter/material.dart';

import 'package:nowrth/constants/app_colors.dart';
import 'package:nowrth/constants/size_config.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final IconData iconData;
  final Function() onPressed;

  CustomFloatingActionButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: percentageHeight(8.13),
      width: percentageHeight(8.13),
      child: FittedBox(
        child: FloatingActionButton(
          child: Icon(
            iconData,
            color: Colors.white,
          ),
          backgroundColor: kPrimaryColor,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
