import 'package:flutter/material.dart';

import 'package:nowrth/constants.dart';
import 'package:nowrth/size_config.dart';

class Timeline extends StatelessWidget {
  final List<Widget> timelineContents;

  const Timeline({
    Key? key,
    required this.timelineContents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        TimelineConnector(connectorType: ConnectorType.start),
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceEvenly,
          children: <Widget>[
            ...List.generate(
              timelineContents.length,
              (index) {
                return Row(
                  children: <Widget>[
                    TimelineConnector(connectorType: ConnectorType.content),
                    timelineContents[index],
                  ],
                );
              },
            ),
          ],
        ),
        TimelineConnector(connectorType: ConnectorType.end),
      ],
    );
  }
}

class TimelineConnector extends StatelessWidget {
  final ConnectorType connectorType;

  const TimelineConnector({
    Key? key,
    required this.connectorType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          // fit: StackFit.passthrough,
          children: [
            if (connectorType == ConnectorType.content)
              Container(
                margin: EdgeInsets.only(top: 7, left: 7),
                width: 50,
                height: 5,
                color: Colors.black,
              ),
            Container(
              margin: EdgeInsets.only(left: 7),
              height: 100,
              width: 5,
              color: Colors.black,
            ),
            // Positioned(
            // child:
            Align(
              alignment: (connectorType == ConnectorType.content)
                  ? Alignment.center
                  : ((connectorType == ConnectorType.start)
                      ? Alignment.topCenter
                      : Alignment.bottomCenter),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // ),
          ],
        ),
      ],
    );
  }
}

enum ConnectorType {
  start,
  content,
  end,
}
