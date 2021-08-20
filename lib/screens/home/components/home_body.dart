import 'package:flutter/material.dart';
import 'package:nowrth/size_config.dart';

import 'home_header.dart';
import 'popular_places.dart';
import 'top_guides.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You have to call SizeConfig on your starting page
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: SafeArea(
        top: false,
        child: Column(
          children: <Widget>[
            HomeHeader(),
            VerticalSpacing(),
            PopularPlaces(),
            VerticalSpacing(),
            TopGuides(),
            VerticalSpacing(),
          ],
        ),
      ),
    );
  }
}
