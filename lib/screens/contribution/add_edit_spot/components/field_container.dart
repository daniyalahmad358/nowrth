import 'package:flutter/widgets.dart';

import 'package:nowrth/global/size_config.dart';

class FieldContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const FieldContainer({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.margin = const EdgeInsets.symmetric(vertical: 7.5),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width ?? percentageWidth(80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
