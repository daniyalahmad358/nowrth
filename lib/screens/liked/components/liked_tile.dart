import 'package:flutter/material.dart';

import 'package:nowrth/global/size_config.dart';

import 'package:nowrth/models/classes/spot.dart';
// import 'package:nowrth/models/classes/guide.dart';
import 'package:nowrth/screens/details/details_screen.dart';
import 'package:nowrth/utils/cus_navigator.dart';

class LikedTile extends StatelessWidget {
  final Function() pageRefresher;
  final Function() deleteFunction;
  final Spot likedSpot;

  const LikedTile({
    Key? key,
    required this.pageRefresher,
    required this.deleteFunction,
    required this.likedSpot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          leading: Container(
            width: percentageHeight(10),
            height: percentageHeight(8),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), // TODO
            ),
            child: AspectRatio(
              aspectRatio: 1.29,
              child: Image(
                height: 200,
                image: likedSpot.images[0].image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            likedSpot.spotName,
            style: TextStyle(
              fontSize: percentageHeight(2.25),
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: SizedBox(
            child: Text(
              likedSpot.address.cityOrTown + ', ' + likedSpot.address.country,
              style: TextStyle(
                fontSize: percentageHeight(1.75),
              ),
            ),
          ),
          trailing: SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  likedSpot.iconData,
                  // size: 20,
                ),
                const SizedBox(width: 15),
                IconButton(
                  icon: const Icon(
                    Icons.favorite,
                    size: 30,
                  ),
                  splashRadius: 1,
                  onPressed: () {
                    deleteFunction();
                  },
                ),
              ],
            ),
          ),
          onTap: () {
            CusNavigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return DetailsScreen(spot: likedSpot);
                },
              ),
            );
          },
        ),
        const Divider(height: 0),
      ],
    );
  }
}
