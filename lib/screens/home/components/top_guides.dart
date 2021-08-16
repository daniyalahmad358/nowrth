import 'package:flutter/material.dart';

import 'package:nowrth/components/section_title.dart';
import 'package:nowrth/models/guide.dart';

import 'package:nowrth/constants.dart';
import 'package:nowrth/size_config.dart';

class TopGuides extends StatelessWidget {
  const TopGuides({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: "Top Guides on Spark", press: () {}),
        VerticalSpacing(of: 20),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding),
          ),
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          // height: getProportionateScreenHeight(119.17),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [kDefualtShadow],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
        children: [
          ClipOval(
            child: Image.asset(
              user.image,
              height: getProportionateScreenWidth(45.83),
              width: getProportionateScreenWidth(45.83),
              fit: BoxFit.cover,
            ),
          ),
          VerticalSpacing(of: 10),
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
