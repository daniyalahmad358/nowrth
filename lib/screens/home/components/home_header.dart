import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nowrth/constants/size_config.dart';

import 'search_fields.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenWidth(20.83)),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/app_images/home_bg.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: getProportionateScreenHeight(237.7),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: getProportionateScreenHeight(60.4)),
              Text(
                'Nowrth',
                style: GoogleFonts.acme(
                  textStyle: TextStyle(
                    fontSize: getProportionateScreenHeight(60),
                    color: Colors.white,
                    height: 0.5,
                    shadows: [
                      Shadow(
                        color: Colors.grey[800]!,
                        offset: const Offset(5, 5),
                        blurRadius: 5,
                      )
                    ],
                  ),
                ),
              ),
              Text(
                'Travel Community App',
                style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenHeight(18),
                    shadows: [
                      Shadow(
                        color: Colors.grey[900]!,
                        offset: const Offset(2, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: getProportionateScreenWidth(-20.83),
            child: const SearchField(),
          )
        ],
      ),
    );
  }
}
