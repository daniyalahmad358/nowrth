import 'package:flutter/widgets.dart';

import 'package:nowrth/constants/app_paddings.dart';
import 'package:nowrth/constants/size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(kDefaultPadding),
      ),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenHeight(13.33),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: press,
            child: Text('See All'),
          ),
        ],
      ),
    );
  }
}
