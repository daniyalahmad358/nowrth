import 'package:flutter/material.dart';
import 'package:nowrth/models/classes/contribution.dart';
import 'package:nowrth/screens/contribution/contributions/contributions_screen.dart';

void successfulRoute({
  required BuildContext context,
  required List<ContributionListItem> list,
  required ContributionListItem itemToAdd,
}) {
  Navigator.pop(context);
  list.removeWhere((element) => element.id == itemToAdd.id);
  list.insert(0, itemToAdd);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ContributionsScreen(
        allContributions: list,
      ),
    ),
  );
}
