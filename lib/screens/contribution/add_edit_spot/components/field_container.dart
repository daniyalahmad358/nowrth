import 'package:flutter/widgets.dart';

import 'package:nowrth/constants/app_colors.dart';
import 'package:nowrth/constants/size_config.dart';

class FieldContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double? verticalPadding;
  final double? horizontalPadding;
  const FieldContainer({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.verticalPadding,
    this.horizontalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(
        horizontal: (horizontalPadding != null) ? horizontalPadding! : 20,
        vertical: (verticalPadding != null) ? verticalPadding! : 0,
      ),
      height: height,
      width: (width != null) ? width : percentageWidth(80),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
