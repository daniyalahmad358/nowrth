import 'package:flutter/material.dart';
import 'package:nowrth/components/notification_card.dart';
// import 'package:nowrth/components/place_card.dart';
import 'package:nowrth/models/NotificationModel.dart';
// import 'package:nowrth/constants.dart';
// import 'package:nowrth/models/TravelSpot.dart';
// import 'package:nowrth/screens/details/details_screen.dart';
import 'package:nowrth/size_config.dart';

class Body extends StatelessWidget {
  final notiBorderRadius = BorderRadius.circular(SizeConfig.screenWidth / 34.5);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(
          theNotifications.length,
          (index) => Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.screenHeight / 120,
              horizontal: SizeConfig.screenWidth / 15,
            ),
            child: Container(
              child: InkWell(
                borderRadius: notiBorderRadius,
                child: NotificationCard(
                  theNotification: theNotifications[index],
                  press: () {},
                  notiBorderRadius: notiBorderRadius,
                ),
                onTap: () {},
              ),
            ),
          ),
        ),
        // AddNewPlaceCard(),
      ],
    );
  }
}
