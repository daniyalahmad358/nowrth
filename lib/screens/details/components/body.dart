import 'package:flutter/material.dart';
import 'package:nowrth/size_config.dart';

import 'package:nowrth/utils/places.dart';

// import 'home_header.dart';
// import 'popular_places.dart';
// import 'top_guides.dart';

class Body extends StatelessWidget {
  const Body({
    @required this.builtSlider,
    @required this.travelSpotName,
  });

  final Container builtSlider;
  final String travelSpotName;

  @override
  Widget build(BuildContext context) {
    // You have to call SizeConfig on your starting page
    SizeConfig().init(context);
    return ListView(
      children: <Widget>[
        SizedBox(height: 10.0),
        builtSlider,
        SizedBox(height: 20),
        ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    travelSpotName,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.bookmark,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 14,
                  color: Colors.blueGrey[300],
                ),
                SizedBox(width: 3),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${places[0]["location"]}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.blueGrey[300],
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "${places[0]["price"]}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 40),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "${places[0]["details"]}",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ],
    );
  }
}
