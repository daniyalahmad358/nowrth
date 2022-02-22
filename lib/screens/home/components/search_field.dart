import 'package:flutter/material.dart';

import 'package:nowrth/global/app_paddings.dart';
import 'package:nowrth/global/app_shadows.dart';
import 'package:nowrth/global/size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [kDefaultShadow],
      ),
      child: Container(
        width: getProportionateScreenWidth(260),
        height: getProportionateScreenHeight(40),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
        ),
        child: TextField(
          onChanged: (value) {},
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search your destination…',
            hintStyle: TextStyle(
              fontSize: getProportionateScreenHeight(13),
            ),
            suffixIcon: const Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(kDefaultPadding),
              vertical: getProportionateScreenHeight(8.33),
            ),
          ),
        ),
      ),
    );
  }
}
