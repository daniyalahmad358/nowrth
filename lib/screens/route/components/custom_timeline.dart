import 'package:flutter/material.dart';

import 'package:nowrth/global/size_config.dart';
import 'package:nowrth/screens/route/components/enums/connector_type.dart';

import 'package:nowrth/screens/route/components/enums/sides.dart';

import 'timeline_content.dart';

class CustomTimeline extends StatelessWidget {
  final List<TimelineContent> timelineContents;
  final List<String?>? sideValues;

  const CustomTimeline({
    Key? key,
    required this.timelineContents,
    this.sideValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double connectorBarHeight = (timelineContents.length > 4)
        ? ((percentageHeight(100)) / 6).roundToDouble()
        : ((percentageHeight(100) - 10) / (timelineContents.length + 3))
            .roundToDouble();
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        verticalDirection: VerticalDirection.up,
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
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
                    sideValue: sideValues?[index],
                  ),
                ],
              );
            },
          ),
          TimelineConnector(
            connectorType: ConnectorType.end,
            barHeight: connectorBarHeight,
            sideValue: sideValues?[-1] ?? '',
          ),
          const SizedBox(
            height: 5,
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
        shape: BoxShape.circle,
        color: Colors.blueGrey[200],
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
                  ? const EdgeInsets.only(bottom: 5)
                  : (connectorType == ConnectorType.end)
                      ? const EdgeInsets.only(top: 5)
                      : null,
              height: barHeight,
              width: 2,
              color: Colors.blueGrey[200],
            ),
            if (sideValue != null && contentSide != Side.left)
              const SizedBox(width: 14),
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
                    ? const EdgeInsets.only(left: 29)
                    : const EdgeInsets.only(right: 29),
                height: 2,
                width: 35,
                color: Colors.blueGrey[200],
              ),
              Container(
                margin: (contentSide == Side.right)
                    ? const EdgeInsets.only(left: 174)
                    : const EdgeInsets.only(right: 174),
                child: contentWidget!,
              ),
            ],
          ),
        connectorCircle,
      ],
    );
  }
}
