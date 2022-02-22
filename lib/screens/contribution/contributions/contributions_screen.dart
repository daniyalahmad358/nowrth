import 'package:flutter/material.dart';
import 'package:nowrth/models/classes/contribution.dart';

import 'package:nowrth/models/enums/app_pages.dart';

import 'package:nowrth/components/custom_app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/components/drawer/custom_drawer.dart';
import 'package:nowrth/components/custom_floating_action_button.dart';
import 'package:nowrth/providers/route_providers.dart';

import 'package:nowrth/screens/contribution/add_edit_spot/add_edit_contribution_screen.dart';

import 'package:nowrth/screens/contribution/contributions/contributions_body.dart';
import 'package:nowrth/utils/cus_navigator.dart';

class ContributionsScreen extends StatefulWidget {
  const ContributionsScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ContributionsScreenState createState() => _ContributionsScreenState();
}

class _ContributionsScreenState extends State<ContributionsScreen> {
  final List<ContributionListItem> allContributions =
      AllContributionsLIProvider.getAllContributionsLi;

  final currentPage = AppPage.contributions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Contributions',
        currentPage: currentPage,
      ),
      body: ContributionsBody(allContributions: allContributions),
      bottomNavigationBar: CustomBottomNavBar(currentPage: currentPage),
      drawer: CustomDrawer(currentPage: currentPage),
      floatingActionButton: CustomFloatingActionButton(
        iconData: Icons.add,
        onPressed: () {
          ContributionsPageRefresherProvider.contributionsPageRefresher = () {
            setState(() {});
          };
          CusNavigator.pushRemTilHome(
            context,
            MaterialPageRoute(
              builder: (context) => const AddEditContributionScreen(
                page: AppPage.addContribution,
              ),
            ),
          );
        },
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }
}
