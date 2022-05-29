import 'package:flutter/material.dart';

import 'package:nowrth/global/size_config.dart';

import 'package:nowrth/screens/liked/components/liked_tile.dart';

import 'package:nowrth/temp/user_data.dart';

// Has to be stateful
class LikedBody extends StatefulWidget {
  const LikedBody({Key? key}) : super(key: key);

  void closeIconButton(index, Function setState) {
    likedSpots.remove(likedSpots[index]);
    setState();
  }

  @override
  _LikedBodyState createState() => _LikedBodyState();
}

class _LikedBodyState extends State<LikedBody> {
  @override
  Widget build(BuildContext context) {
    List<Widget> likedTravelSpotCards = List.generate(
      likedSpots.length,
      (index) => LikedTile(
        likedSpot: likedSpots[index],
        deleteFunction: () {
          likedSpots.remove(likedSpots[index]);
          setState(() {});
        },
        pageRefresher: () {},
      ),
    );

    return ListView(
      children: <Widget>[
        SizedBox(
          width: SizeConfig.screenWidth,
          child: SingleChildScrollView(
            child: IconTheme(
              data: Theme.of(context).primaryIconTheme,
              child: Column(
                children: likedTravelSpotCards,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
