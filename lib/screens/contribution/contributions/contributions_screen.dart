import 'package:flutter/material.dart';

import 'package:nowrth/constants/app_pages.dart';

import 'package:nowrth/components/drawer/menu_items.dart';
import 'package:nowrth/components/custom_app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/components/drawer/custom_drawer.dart';
import 'package:nowrth/components/custom_floating_action_button.dart';

import 'package:nowrth/screens/contribution/add_edit_spot/add_edit_spot_screen.dart';

import 'package:nowrth/screens/contribution/contributions/components/contributions_body.dart';

class ContributionsScreen extends StatelessWidget {
  final currentPage = AppPage.contributions;

  const ContributionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        titleText: 'Contributions',
        atPage: currentPage,
      ),
      body: ContributionsBody(),
      bottomNavigationBar: CustomBottonNavBar(),
      drawer: CustomDrawer(
        currentPage: currentPage,
        menuItems: menuItems(context, currentPage),
      ),
      floatingActionButton: CustomFloatingActionButton(
        iconData: Icons.add,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEditSpotScreen(
                addEditPage: AppPage.addContribution,
              ),
            ),
          );
        },
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
