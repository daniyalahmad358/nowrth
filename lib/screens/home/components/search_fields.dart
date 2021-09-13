import 'package:flutter/material.dart';

import 'package:nowrth/constants/app_paddings.dart';
import 'package:nowrth/constants/size_config.dart';

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color(0xFF3E4067),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(3, 3),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.16),
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
            color: const Color(0xFF464A7E),
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
