import 'package:nowrth/constants/app_pages.dart';

bool isOnPage(AppPage currentPage, AppPage comparedPage) {
  if (currentPage == comparedPage) {
    return true;
  }
  return false;
}
