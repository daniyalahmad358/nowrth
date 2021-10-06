import 'package:flutter/material.dart';
import 'package:nowrth/global/size_config.dart';

import 'package:nowrth/screens/liked/liked_screen.dart';
import 'package:nowrth/screens/home/home_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  final bool isAtHome;
  final bool isAtLiked;
  const CustomBottomNavBar({
    Key? key,
    this.isAtHome = false,
    this.isAtLiked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Container(
        width: percentageWidth(70),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: BottomNavigationBar(
          currentIndex: (isAtHome) ? 0 : 1,
          onTap: (int i) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    (i == 0) ? const HomeScreen() : const LikedScreen(),
              ),
            );
          },
          items: const [
            BottomNavigationBarItem(
                label: 'Home', icon: Icon(Icons.home), tooltip: ''),
            BottomNavigationBarItem(
                label: 'Liked', icon: Icon(Icons.favorite), tooltip: ''),
          ],
        ),
      ),
    );
  }
}
