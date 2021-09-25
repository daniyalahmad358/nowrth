import 'package:flutter/material.dart';
import 'package:nowrth/models/classes/contribution.dart';

import 'package:nowrth/models/enums/app_pages.dart';

import 'package:nowrth/components/custom_app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';

import 'package:nowrth/screens/contribution/add_edit_spot/components/add_edit_contribution_body.dart';

class AddEditContributionScreen extends StatelessWidget {
  final AppPage addEditPage;
  final int? contributionToEditId;
  final Function()? contributionsPageRefresher;

  const AddEditContributionScreen({
    Key? key,
    required this.addEditPage,
    required this.contributionsPageRefresher,
    this.contributionToEditId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        titleText:
            (addEditPage == AppPage.addContribution) ? 'Add Spot' : 'Edit Spot',
        atPage: addEditPage,
      ),
      body: AddEditContributionBody(
        curentPage: addEditPage,
        contributionToEditId: contributionToEditId,
        contributionsPageRefresher: contributionsPageRefresher,
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
      extendBodyBehindAppBar: true,
    );
  }
}
