import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:nowrth/global/size_config.dart';
import 'package:nowrth/models/classes/contribution.dart';

class ContributionTile extends StatelessWidget {
  final int index;
  final Function() pageRefresher;
  final Function(int id) editFunction;
  final Function(int id) deleteFunction;
  final ContributionListItem currentContributionLI;

  const ContributionTile(
    this.index, {
    Key? key,
    required this.pageRefresher,
    required this.editFunction,
    required this.deleteFunction,
    required this.currentContributionLI,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slidable(
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
                  image: currentContributionLI.thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                currentContributionLI.name,
                style: TextStyle(
                  fontSize: percentageHeight(2.25),
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: SizedBox(
                child: Text(
                  currentContributionLI.address.cityOrTown +
                      ', ' +
                      currentContributionLI.address.country,
                  style: TextStyle(
                    fontSize: percentageHeight(1.75),
                  ),
                ),
              ),
              trailing: Column(
                children: [
                  Icon(IconData(
                    currentContributionLI.statusIconCode,
                    fontFamily: 'MaterialIcons',
                  )),
                  SizedBox(height: percentageHeight(0.5)),
                  Icon(
                    IconData(
                      currentContributionLI.spotTypeIconCode,
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
            endActionPane: ActionPane(
              extentRatio: 0.09,
              motion: const ScrollMotion(),
              children: [
                /*
                CustomSlidableAction(
                  child: const Icon(
                    Icons.edit, size: 20,
                    // color: Colors.white,
                  ),
                  onPressed: (x) {
                    editFunction(currentContributionLI.id);
                  },
                ),
                CustomSlidableAction(
                  // color: Colors.red,
                  child: const Icon(
                    Icons.delete, size: 20,
                    // color: Colors.white,
                  ),
                  onPressed: (x) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        buttonPadding: EdgeInsets.zero,
                        title: Text(
                          'Delete ${currentContributionLI.name}',
                          style: TextStyle(
                            fontSize: percentageHeight(2.4),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: Text(
                          '${currentContributionLI.name} will be deleted permanently',
                          style: TextStyle(fontSize: percentageHeight(2.1)),
                        ),
                        actions: [
                          Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 1,
                                height: 30,
                                // color: kGreyColor,
                              ),
                              Expanded(
                                child: MaterialButton(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: const Text('Confirm'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    deleteFunction(currentContributionLI.id);
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
                */
                SlidableAction(
                  // color: Colors.blue,
                  icon: Icons.edit,

                  onPressed: (x) {
                    editFunction(currentContributionLI.id);
                  },
                ),
                SlidableAction(
                  // color: Colors.red,
                  icon: Icons.delete,
                  onPressed: (x) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        buttonPadding: EdgeInsets.zero,
                        title: Text(
                          'Delete ${currentContributionLI.name}',
                          style: TextStyle(
                            fontSize: percentageHeight(2.4),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: Text(
                          '${currentContributionLI.name} will be deleted permanently',
                          style: TextStyle(fontSize: percentageHeight(2.1)),
                        ),
                        actions: [
                          Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 1,
                                height: 30,
                                // color: kGreyColor,
                              ),
                              Expanded(
                                child: MaterialButton(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: const Text('Confirm'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    deleteFunction(currentContributionLI.id);
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
            )
            // TODO: Lookout for unexpected changes due to update

            /*
          secondaryActions: [
            SlideAction(
              // color: Colors.blue,
              child: const Icon(
                Icons.edit, size: 20,
                // color: Colors.white,
              ),
              onTap: () {
                editFunction(currentContributionLI.id);
              },
            ),
            SlideAction(
              // color: Colors.red,
              child: const Icon(
                Icons.delete, size: 20,
                // color: Colors.white,
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    buttonPadding: EdgeInsets.zero,
                    title: Text(
                      'Delete ${currentContributionLI.name}',
                      style: TextStyle(
                        fontSize: percentageHeight(2.4),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    content: Text(
                      '${currentContributionLI.name} will be deleted permanently',
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
                          const SizedBox(
                            width: 1,
                            height: 30,
                            // color: kGreyColor,
                          ),
                          Expanded(
                            child: MaterialButton(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: const Text('Confirm'),
                              onPressed: () {
                                Navigator.pop(context);
                                deleteFunction(currentContributionLI.id);
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
          */
            ),
        const Divider(height: 0),
      ],
    );
  }
}
