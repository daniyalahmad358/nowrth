import 'package:flutter/widgets.dart';

class TRCornerWidget extends StatelessWidget {
  final Widget mainWidget;
  final Widget cornerIconButton;

  const TRCornerWidget({
    Key? key,
    required this.mainWidget,
    required this.cornerIconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        mainWidget,
        Positioned(
          right: 0.0,
          top: 0.0,
          child: cornerIconButton,
        ),
      ],
    );
  }
}
