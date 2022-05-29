import 'package:flutter/material.dart';

import 'package:nowrth/models/classes/contribution.dart';
import 'package:nowrth/models/enums/app_pages.dart';
import 'package:nowrth/providers/contribution_provider.dart';
import 'package:nowrth/providers/route_providers.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/add_edit_contribution_screen.dart';
import 'package:nowrth/screens/contribution/contributions/components/contribution_tile.dart';
import 'package:nowrth/utils/cus_navigator.dart';

// Has to be stateful
class ContributionsBody extends StatefulWidget {
  final List<ContributionListItem> allContributions;

  const ContributionsBody({
    Key? key,
    required this.allContributions,
  }) : super(key: key);

  Future<List<ContributionListItem>> empty() async {
    List<ContributionListItem> x = <ContributionListItem>[];
    return x;
  }

  @override
  _ContributionsBodyState createState() => _ContributionsBodyState();
}

class _ContributionsBodyState extends State<ContributionsBody> {
  // IconButton optionsIconButton(index) {
  //   return IconButton(
  //     icon: const Icon(
  //       Icons.more_horiz,
  //     ),
  //     color: Colors.white,
  //     iconSize: percentageHeight(4),
  //     splashRadius: percentageHeight(3.5),
  //     padding: const EdgeInsets.all(2),
  //     alignment: Alignment.topCenter,
  //     onPressed: () {},
  //     /*
  //       // => OptionsMenu.showMenu(
  //       // context,
  //       // contribution: contributions[index],
  //       // refresher: () {
  //       // setState(() {});
  //       // },
  //       // ),
  //     */
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          // (widget.allContributions.isEmpty)
          // ? ContributionProvider.getContributionListItems()
          // :
          null,
      builder: (BuildContext context,
          AsyncSnapshot<List<ContributionListItem>> snapshot) {
        if (snapshot.connectionState != ConnectionState.waiting) {
          List<ContributionListItem> contributions;
          if (widget.allContributions.isNotEmpty) {
            contributions = widget.allContributions;
          } else {
            contributions = snapshot.data!;
            widget.allContributions.clear();
            widget.allContributions.addAll(contributions);
          }
          return ListView(
            children: List.generate(
              contributions.length,
              (index) => ContributionTile(
                index,
                currentContributionLI: contributions[index],
                editFunction: (int contributionToEditId) {
                  ContributionToEditIdProvider.contributionToEditId =
                      contributionToEditId;
                  CusNavigator.pushRemTilHome(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddEditContributionScreen(
                        page: AppPage.editContribution,
                      ),
                    ),
                  );
                },
                deleteFunction: (int contributionToDeleteId) {
                  contributions.removeWhere(
                    (element) => element.id == contributionToDeleteId,
                  );
                  ContributionProvider.deleteContribution(
                    id: contributionToDeleteId,
                  );
                  setState(() {});
                },
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
