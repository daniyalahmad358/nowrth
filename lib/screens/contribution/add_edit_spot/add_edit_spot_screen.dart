import 'package:flutter/material.dart';

import 'package:nowrth/models/enums/app_pages.dart';

import 'package:nowrth/components/custom_app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';
import 'package:nowrth/models/classes/spot.dart';

import 'package:nowrth/screens/contribution/add_edit_spot/components/add_edit_spot_body.dart';

class AddEditSpotScreen extends StatelessWidget {
  final AppPage addEditPage;
  final Spot? spotToEdit;
  final Function()? contributionsPageRefresher;

  const AddEditSpotScreen({
    Key? key,
    required this.addEditPage,
    required this.contributionsPageRefresher,
    this.spotToEdit,
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
      body: AddEditSpotBody(
        curentPage: addEditPage,
        spotToEdit: spotToEdit,
        contributionsPageRefresher: contributionsPageRefresher,
      ),
      bottomNavigationBar: const CustomBottonNavBar(),
      extendBodyBehindAppBar: true,
    );
  }
}
