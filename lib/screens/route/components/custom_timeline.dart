import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:nowrth/constants.dart';
import 'package:nowrth/size_config.dart';

class CustomTimeline extends StatelessWidget {
  final List<Widget> timelineContents;

  const CustomTimeline({
    Key? key,
    required this.timelineContents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double connectorBarHeight =
        (percentageHeight(78) / (timelineContents.length + 2)).roundToDouble();
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        verticalDirection: VerticalDirection.up,
        children: <Widget>[
          TimelineConnector(
            connectorType: ConnectorType.start,
            barHeight: connectorBarHeight,
          ),
          ...List.generate(
            timelineContents.length,
            (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TimelineConnector(
                    connectorType: ConnectorType.content,
                    contentWidget: timelineContents[index],
                    barHeight: connectorBarHeight,
                    contentSide: (index % 2 == 0)
                        ? (ContentSide.right)
                        : (ContentSide.left),
                  ),
                ],
              );
            },
          ),
          TimelineConnector(
            connectorType: ConnectorType.end,
            barHeight: connectorBarHeight,
          ),
        ],
      ),
    );
  }
}

class TimelineConnector extends StatelessWidget {
  final ConnectorType connectorType;
  final double barHeight;
  final Widget? contentWidget;
  final ContentSide? contentSide;
  // final Widget? contentWidget;
  // TODO: preferred side

  TimelineConnector({
    Key? key,
    required this.connectorType,
    required this.barHeight,
    this.contentWidget,
    this.contentSide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Container connectorCircle = Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        // color: kPrimaryColor,
        color: kTextColor,
        shape: BoxShape.circle,
      ),
    );

    return Container(
      // color: Colors.red,
      child: Stack(
        alignment: (connectorType == ConnectorType.start)
            ? AlignmentDirectional.bottomCenter
            : (connectorType == ConnectorType.end)
                ? AlignmentDirectional.topCenter
                : AlignmentDirectional.center,
        children: [
          Container(
            margin: (connectorType == ConnectorType.start)
                ? EdgeInsets.only(bottom: 10)
                : (connectorType == ConnectorType.end)
                    ? EdgeInsets.only(top: 10)
                    : null,
            height: barHeight,
            width: 2,
            color: Colors.grey,
          ),
          if (contentWidget != null)
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  margin: (contentSide == ContentSide.right)
                      ? EdgeInsets.only(left: percentageHeight(10))
                      : EdgeInsets.only(right: percentageHeight(10)),
                  height: 2,
                  width: percentageHeight(10),
                  color: Colors.grey,
                ),
                connectorCircle,
                Container(
                  margin: (contentSide == ContentSide.right)
                      ? EdgeInsets.only(left: percentageHeight(15))
                      : EdgeInsets.only(right: percentageHeight(15)),
                  child: contentWidget!,
                ),
              ],
            ),
          if (contentWidget == null) connectorCircle,
        ],
      ),
    );
  }
}

enum ConnectorType {
  start,
  content,
  end,
}

enum ContentSide {
  left,
  right,
}
