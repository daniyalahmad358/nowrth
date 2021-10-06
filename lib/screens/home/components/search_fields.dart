import 'package:flutter/material.dart';

import 'package:nowrth/global/app_paddings.dart';
import 'package:nowrth/global/size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(260.83),
      height: getProportionateScreenHeight(41.67),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(),
        boxShadow: const [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 10,
            // color: Colors.black.withOpacity(0.16),
            spreadRadius: -2,
          )
        ],
      ),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          hintText: 'Search your destination…',
          hintStyle: TextStyle(
            fontSize: getProportionateScreenHeight(12),
          ),
          suffixIcon: const Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding),
            vertical: getProportionateScreenHeight(8.33),
          ),
        ),
      ),
    );
  }
}
