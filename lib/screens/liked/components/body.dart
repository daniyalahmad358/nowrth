import 'package:flutter/material.dart';
import 'package:nowrth/components/place_card.dart';
// import 'package:nowrth/constants.dart';
import 'package:nowrth/models/TravelSpot.dart';
// import 'package:nowrth/screens/details/details_screen.dart';
import 'package:nowrth/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          width: SizeConfig.screenWidth,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20.83)),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: percentageHeight(1.62)),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runSpacing: 25,
                  children: [
                    ...List.generate(
                      travelSpots.length,
                      (index) => PlaceCard(
                        travelSpot: travelSpots[index],
                        isFullCard: true,
                        press: () {},
                      ),
                    ),
                    // AddNewPlaceCard(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class AddNewPlaceCard extends StatelessWidget {
//   const AddNewPlaceCard({
//     Key key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: percentageHeight(39.024),
//       // height: percentageHeight(250),
//       width: getProportionateScreenWidth(131.67),
//       decoration: BoxDecoration(
//         color: Color(0xFF6A6C93).withOpacity(0.09),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           width: 2,
//           color: Color(0xFFEBE8F6),
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: getProportionateScreenHeight(44.17),
//             width: getProportionateScreenWidth(44.17),
//             child: TextButton(
//               style: ButtonStyle(
//                 padding: MaterialStateProperty.all(EdgeInsets.zero),
//                 shape: MaterialStateProperty.all(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(60),
//                   ),
//                 ),
//                 backgroundColor: MaterialStateProperty.all(kPrimaryColor),
//               ),
//               onPressed: () {},
//               child: Icon(
//                 Icons.add,
//                 size: getProportionateScreenHeight(29.17),
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           VerticalSpacing(of: 10),
//           Text(
//             "Add New Place",
//             style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }
