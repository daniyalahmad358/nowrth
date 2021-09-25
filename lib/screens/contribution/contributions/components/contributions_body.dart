import 'package:flutter/material.dart';

import 'package:nowrth/constants/size_config.dart';
import 'package:nowrth/models/classes/contribution.dart';
import 'package:nowrth/providers/contribution_provider.dart';
// import 'package:nowrth/models/classes/contribution.dart';
// import 'package:nowrth/models/enums/contribution_status.dart';
import 'package:nowrth/screens/contribution/contributions/components/contribution_tile.dart';
import 'package:nowrth/screens/contribution/contributions/components/options_menu.dart';

import 'package:nowrth/temp/user_data.dart';

// Has to be stateful
class ContributionsBody extends StatefulWidget {
  final ContributionListItem? addedContribution;

  const ContributionsBody({
    Key? key,
    this.addedContribution,
  }) : super(key: key);

  @override
  _ContributionsBodyState createState() => _ContributionsBodyState();
}

class _ContributionsBodyState extends State<ContributionsBody> {
  IconButton optionsIconButton(index) {
    return IconButton(
      icon: const Icon(
        Icons.more_horiz,
      ),
      color: Colors.white,
      iconSize: percentageHeight(4),
      splashRadius: percentageHeight(3.5),
      padding: const EdgeInsets.all(2),
      alignment: Alignment.topCenter,
      onPressed: () {},
      /*
        // => OptionsMenu.showMenu(
        // context,
        // contribution: contributions[index],
        // refresher: () {
        // setState(() {});
        // },
        // ),
      */
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ContributionProvider.getContributionListItems(),
      builder: (BuildContext context,
          AsyncSnapshot<List<ContributionListItem>> snapshot) {
        List<ContributionListItem> contributions = snapshot.data!;
        if (snapshot.connectionState != ConnectionState.waiting) {
          if (widget.addedContribution != null) {
            contributions.insert(0, widget.addedContribution!);
          }
          return ListView(
            children: List.generate(
              contributions.length,
              (index) => ContributionTile(
                index,
                contributionListItem: contributions[index],
                pageRefresher: () {
                  setState(() {});
                },
              ),
            ),
          );
        } else {
          return const Text('Loading');
        }
      },
    );
  }
}
