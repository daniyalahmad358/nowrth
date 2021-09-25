import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nowrth/constants/app_colors.dart';

import 'package:nowrth/constants/size_config.dart';
import 'package:nowrth/models/classes/contribution.dart';
import 'package:nowrth/models/enums/app_pages.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/add_edit_contribution_screen.dart';

class ContributionTile extends StatelessWidget {
  final int index;
  final Function() pageRefresher;
  final ContributionListItem contributionListItem;

  const ContributionTile(
    this.index, {
    Key? key,
    required this.pageRefresher,
    required this.contributionListItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slidable(
          actionExtentRatio: 0.09,
          actionPane: const SlidableScrollActionPane(),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            leading: Container(
              width: percentageHeight(8),
              height: percentageHeight(8),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image(
                image: contributionListItem.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              contributionListItem.name,
              style: TextStyle(
                fontSize: percentageHeight(2.25),
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: SizedBox(
              child: Text(
                contributionListItem.address.cityOrTown +
                    ', ' +
                    contributionListItem.address.country,
                style: TextStyle(
                  fontSize: percentageHeight(1.75),
                ),
              ),
            ),
            trailing: Column(
              children: [
                Icon(IconData(contributionListItem.statusIconCode)),
                SizedBox(height: percentageHeight(0.5)),
                Icon(
                  IconData(
                    contributionListItem.spotTypeIconCode,
                    fontFamily: 'MaterialIcons',
                  ),
                  size: 20,
                ),
              ],
            ),
            onTap: () {
              //  Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => DetailsScreen(spot: spot),
              //     ),
              //   );
            },
          ),
          secondaryActions: [
            SlideAction(
              color: Colors.blue,
              child: const Icon(Icons.edit, size: 20, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEditContributionScreen(
                      addEditPage: AppPage.editContribution,
                      contributionToEditId: contributionListItem.id,
                      contributionsPageRefresher: pageRefresher,
                    ),
                  ),
                );
              },
            ),
            SlideAction(
              color: Colors.red,
              child: const Icon(Icons.delete, size: 20, color: Colors.white),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    buttonPadding: EdgeInsets.zero,
                    title: Text(
                      'Delete ${contributionListItem.name}',
                      style: TextStyle(
                        fontSize: percentageHeight(2.4),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    content: Text(
                      '${contributionListItem.name} will be deleted permanently',
                      style: TextStyle(fontSize: percentageHeight(2.1)),
                    ),
                    actions: [
                      Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(width: 1, height: 30, color: kGreyColor),
                          Expanded(
                            child: MaterialButton(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: const Text('Confirm'),
                              onPressed: () {
                                Navigator.pop(context);
                                // contributions.remove(contribution);
                                pageRefresher();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        const Divider(height: 0),
      ],
    );
  }
}
