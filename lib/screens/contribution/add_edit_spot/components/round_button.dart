import 'package:flutter/material.dart';
import 'package:nowrth/constants/app_colors.dart';
import 'package:nowrth/constants/size_config.dart';

// TODO: remove this file if unused
class RoundButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color color, textColor;

  const RoundButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      // width: SizeConfig.screenWidth * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            ),
            backgroundColor: MaterialStateProperty.all(color),
          ),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}