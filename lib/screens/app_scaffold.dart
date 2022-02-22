import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nowrth/models/classes/page_data.dart';
import 'package:nowrth/models/enums/app_pages.dart';

class AppScaffold extends StatefulWidget {
  final AppPage currentPage;
  const AppScaffold({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  PageData? pageData;
  updateScaffold({required PageData newPageData}) {
    setState(() {
      pageData = newPageData;
    });
    setState(() {
      pageData = pageData;
    });
  }

  @override
  void initState() {
    pageData = PageData.fromPage(
      widget.currentPage,
      updateScaffold: updateScaffold,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: pageData?.backgroundDecorationImage),
      child: Scaffold(
        backgroundColor: pageData?.scaffoldColor,
        appBar: pageData?.appBar,
        extendBodyBehindAppBar: pageData!.behindAppBar!,
        drawer: pageData?.drawer,
        body: pageData?.body,
        bottomNavigationBar: pageData?.bottomNavBar,
        extendBody: pageData!.behindBottomNavBar!,
      ),
    );
  }
}
