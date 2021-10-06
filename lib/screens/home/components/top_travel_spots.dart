import 'package:flutter/widgets.dart';

import 'package:nowrth/components/spot_card/spot_card.dart';
import 'package:nowrth/screens/home/components/section_title.dart';

import 'package:nowrth/global/app_paddings.dart';
import 'package:nowrth/global/size_config.dart';
import 'package:nowrth/temp/spot/spot.dart';

class TopTravelSpotsFrame extends StatelessWidget {
  const TopTravelSpotsFrame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionTitle(
          title: 'Top Travel Spots on Nowrth',
          press: () {},
        ),
        const VerticalSpacing(of: 20),
        SingleChildScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              ...List.generate(
                topTravelSpots.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(kDefaultPadding)),
                  child: SpotCard(
                    spot: topTravelSpots[index],
                  ),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(kDefaultPadding),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
