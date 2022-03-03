import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final IconData iconData;
  final Function() onPressed;

  const CustomFloatingActionButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 45,
      child: FittedBox(
        child: FloatingActionButton(
          child: Icon(
            iconData,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
