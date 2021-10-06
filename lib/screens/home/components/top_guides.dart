import 'package:flutter/material.dart';

import 'package:nowrth/screens/home/components/section_title.dart';
import 'package:nowrth/global/app_shadows.dart';
import 'package:nowrth/global/app_paddings.dart';
import 'package:nowrth/models/classes/guide.dart';

import 'package:nowrth/global/size_config.dart';

import 'package:nowrth/temp/top_guides.dart';

class TopGuidesFrame extends StatelessWidget {
  const TopGuidesFrame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionTitle(title: 'Top Contributors on Nowrth', press: () {}),
        const VerticalSpacing(of: 20),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding),
          ),
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          // height: getProportionateScreenHeight(119.17),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [kDefualtShadow],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ...List.generate(
                topGuides.length,
                (index) => GuideCard(
                  user: topGuides[index],
                  press: () {},
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class GuideCard extends StatelessWidget {
  const GuideCard({
    Key? key,
    required this.user,
    required this.press,
  }) : super(key: key);

  final Guide user;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Image.asset(
              user.image,
              height: getProportionateScreenWidth(45.83),
              width: getProportionateScreenWidth(45.83),
              fit: BoxFit.cover,
            ),
          ),
          const VerticalSpacing(of: 10),
          Text(
            user.name,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: percentageWidth(3.1)),
          ),
        ],
      ),
    );
  }
}
