import 'package:flutter/widgets.dart';
import 'package:nowrth/constants/size_config.dart';

import 'home_header.dart';
import 'top_travel_spots.dart';
import 'top_guides.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call SizeConfig on your starting page
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: SafeArea(
        top: false,
        child: Container(
          // color: Colors.blueGrey,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('assets/images/app_images/map_illustration.jpg'),
              colorFilter: ColorFilter.linearToSrgbGamma(),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: const <Widget>[
              HomeHeader(),
              VerticalSpacing(),
              TopTravelSpotsFrame(),
              VerticalSpacing(),
              TopGuidesFrame(),
              VerticalSpacing(),
            ],
          ),
        ),
      ),
    );
  }
}
