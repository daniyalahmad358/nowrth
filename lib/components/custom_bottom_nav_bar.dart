import 'package:flutter/material.dart';
import 'package:nowrth/global/app_shadows.dart';
import 'package:nowrth/global/size_config.dart'; // Needed
import 'package:nowrth/models/enums/app_pages.dart';
import 'package:nowrth/utils/cus_navigator.dart';

class CustomBottomNavBar extends StatelessWidget {
  final ImageProvider? bottomImage;
  final AppPage currentPage;
  const CustomBottomNavBar({
    Key? key,
    required this.currentPage,
    this.bottomImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              boxShadow: [kBottomNavBarOuterShadow],
            ),
          ),
        ),
        Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: 11,
                width: percentageWidth(100),
                decoration: BoxDecoration(
                  image: bottomImage != null
                      ? DecorationImage(
                          image: bottomImage!,
                          colorFilter: const ColorFilter.linearToSrgbGamma(),
                          fit: BoxFit.fitWidth,
                        )
                      : null,
                  color: bottomImage == null
                      ? Theme.of(context).scaffoldBackgroundColor
                      : null,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 7, right: 7, bottom: 10),
              decoration: BoxDecoration(
                boxShadow: [kDefaultShadow],
              ),
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(10),
                child: BottomNavigationBar(
                  currentIndex: getPageNavIndex(currentPage),
                  onTap: (int i) {
                    if (!(i == 0 && currentPage == AppPage.home) &&
                        !(i == 1 && currentPage == AppPage.liked)) {
                      CusNavigator.pushNamedRemTilHome(
                        context,
                        (i == 0) ? AppPage.home.name : AppPage.liked.name,
                      );
                    }
                  },
                  items: const [
                    BottomNavigationBarItem(
                        label: 'Home', icon: Icon(Icons.home), tooltip: ''),
                    BottomNavigationBarItem(
                        label: 'Liked',
                        icon: Icon(Icons.favorite),
                        tooltip: ''),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

int getPageNavIndex(AppPage page) {
  // TODO: When you add more items to the BottomNavigation bar add more return values accordingly
  return (page == AppPage.home) ? 0 : 1;
}
