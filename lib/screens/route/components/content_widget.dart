import 'package:flutter/material.dart';
import 'package:nowrth/screens/route/services/sides.dart';

class TimelineContent extends StatelessWidget {
  final Widget child;
  final Side contentSide;
  const TimelineContent({
    Key? key,
    required this.child,
    required this.contentSide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
