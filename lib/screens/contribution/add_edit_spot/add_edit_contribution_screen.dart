import 'package:flutter/material.dart';

import 'package:nowrth/models/enums/app_pages.dart';

import 'package:nowrth/components/custom_app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/providers/route_providers.dart';

import 'package:nowrth/screens/contribution/add_edit_spot/add_edit_contribution_body.dart';

class AddEditContributionScreen extends StatelessWidget {
  final AppPage page;

  const AddEditContributionScreen({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: (page == AppPage.addContribution) ? 'Add Spot' : 'Edit Spot',
        currentPage: page,
      ),
      body: AddEditContributionBody(
        currentPage: page,
        contributionToEditId:
            ContributionToEditIdProvider.getContributionToEditId,
        contributionsPageRefresher:
            ContributionsPageRefresherProvider.getContributionsPageRefresher,
        contributionListItems: AllContributionsLIProvider.getAllContributionsLi,
      ),
      bottomNavigationBar: CustomBottomNavBar(currentPage: page),
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }
}
