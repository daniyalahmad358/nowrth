import 'package:flutter/material.dart';
import 'package:nowrth/models/classes/contribution.dart';

import 'package:nowrth/models/enums/app_pages.dart';

import 'package:nowrth/components/drawer/menu_items.dart';
import 'package:nowrth/components/custom_app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/components/drawer/custom_drawer.dart';
import 'package:nowrth/components/custom_floating_action_button.dart';

import 'package:nowrth/screens/contribution/add_edit_spot/add_edit_contribution_screen.dart';

import 'package:nowrth/screens/contribution/contributions/components/contributions_body.dart';

class ContributionsScreen extends StatefulWidget {
  final ContributionListItem? addedContribution;

  const ContributionsScreen({
    Key? key,
    this.addedContribution,
  }) : super(key: key);

  @override
  _ContributionsScreenState createState() => _ContributionsScreenState();
}

class _ContributionsScreenState extends State<ContributionsScreen> {
  final currentPage = AppPage.contributions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        titleText: 'Contributions',
        atPage: currentPage,
      ),
      body: ContributionsBody(addedContribution: widget.addedContribution),
      bottomNavigationBar: const CustomBottomNavBar(),
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
              builder: (context) => AddEditContributionScreen(
                addEditPage: AppPage.addContribution,
                contributionsPageRefresher: () {
                  setState(() {});
                },
              ),
            ),
          );
        },
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
