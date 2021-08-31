import 'package:flutter/material.dart';

import 'package:nowrth/constants/app_pages.dart';

import 'package:nowrth/components/app_bar.dart';
import 'package:nowrth/components/custom_bottom_nav_bar.dart';

import 'package:nowrth/screens/contribution/add_edit_spot/components/add_edit_spot_body.dart';

class AddEditSpotScreen extends StatelessWidget {
  final AppPage addEditPage;
  const AddEditSpotScreen({
    Key? key,
    required this.addEditPage,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        titleText:
            (addEditPage == AppPage.addContribution) ? "Add Spot" : "Edit Spot",
        barOpacity: 0.9,
        onNotiPage: true,
      ),
      body: AddEditSpotBody(curentPage: addEditPage),
      bottomNavigationBar: CustomBottonNavBar(),
      extendBodyBehindAppBar: true,
    );
  }
}
