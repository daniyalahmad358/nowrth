import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:nowrth/constants/app_colors.dart';
import 'package:nowrth/constants/size_config.dart';
import 'package:nowrth/screens/route/components/enums/connector_type.dart';

import 'package:nowrth/screens/route/components/enums/sides.dart';

import 'timeline_content.dart';

class CustomTimeline extends StatelessWidget {
  final List<TimelineContent> timelineContents;
  final List<String> sideValues;

  const CustomTimeline({
    Key? key,
    required this.timelineContents,
    this.sideValues = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double connectorBarHeight = (timelineContents.length > 4)
        ? (percentageHeight(78) / (6)).roundToDouble()
        : (percentageHeight(78) / (timelineContents.length + 2))
            .roundToDouble();
    return SingleChildScrollView(
      reverse: true,
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
                    contentSide: timelineContents[index].contentSide,
                    sideValue: sideValues[index],
                  ),
                ],
              );
            },
          ),
          TimelineConnector(
            connectorType: ConnectorType.end,
            barHeight: connectorBarHeight,
            sideValue: sideValues[-1],
          ),
        ],
      ),
    );
  }
}

class TimelineConnector extends StatelessWidget {
  final ConnectorType connectorType;
  final double barHeight;
  final TimelineContent? contentWidget;
  final Side? contentSide;
  final String? sideValue;

  // final Widget? contentWidget;
  // TODO: preferred side

  const TimelineConnector({
    Key? key,
    required this.connectorType,
    required this.barHeight,
    this.contentWidget,
    this.contentSide,
    this.sideValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Container connectorCircle = Container(
      height: percentageHeight(1.65),
      width: percentageHeight(1.65),
      decoration: BoxDecoration(
        color: kTextColor,
        shape: BoxShape.circle,
      ),
    );

    return Stack(
      alignment: (connectorType == ConnectorType.start)
          ? AlignmentDirectional.bottomCenter
          : (connectorType == ConnectorType.end)
              ? AlignmentDirectional.topCenter
              : AlignmentDirectional.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (sideValue != null && contentSide == Side.left)
              const SizedBox(width: 18),
            if (sideValue != null && contentSide != Side.left)
              Container(
                height: barHeight,
                alignment: Alignment.bottomCenter,
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    sideValue!,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            Container(
              margin: (connectorType == ConnectorType.start)
                  ? const EdgeInsets.only(bottom: 10)
                  : (connectorType == ConnectorType.end)
                      ? const EdgeInsets.only(top: 10)
                      : null,
              height: barHeight,
              width: 2,
              color: Colors.blueGrey[200],
            ),
            if (sideValue != null && contentSide != Side.left)
              const SizedBox(width: 18),
            if (sideValue != null && contentSide == Side.left)
              Container(
                height: barHeight,
                alignment: Alignment.bottomCenter,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    sideValue!,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
          ],
        ),
        if (contentWidget != null)
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                margin: (contentSide == Side.right)
                    ? EdgeInsets.only(left: percentageHeight(10))
                    : EdgeInsets.only(right: percentageHeight(10)),
                height: 2,
                width: percentageHeight(10),
                color: Colors.blueGrey[200],
              ),
              Container(
                margin: (contentSide == Side.right)
                    ? EdgeInsets.only(left: percentageHeight(30))
                    : EdgeInsets.only(right: percentageHeight(30)),
                child: contentWidget!,
              ),
            ],
          ),
        connectorCircle,
      ],
    );
  }
}
