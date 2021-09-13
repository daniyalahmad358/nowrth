import 'package:flutter/material.dart';
import 'package:nowrth/constants/app_colors.dart';
import 'package:nowrth/constants/app_pages.dart';
import 'package:nowrth/constants/size_config.dart';
import 'package:nowrth/models/spot.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/add_edit_spot_screen.dart';
import 'package:nowrth/temp/user_data.dart';

class OptionsMenu extends StatelessWidget {
  final Spot contributedSpot;
  final Function() pageRefresher;
  final Spot? spotToEdit;

  const OptionsMenu({
    Key? key,
    required this.contributedSpot,
    required this.pageRefresher,
    this.spotToEdit,
  }) : super(key: key);

  static void showMenu(
    BuildContext context, {
    required Spot contributedSpot,
    required Function() refresher,
    required Spot? spotToEdit,
  }) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        backgroundColor: kPrimaryLightColor,
        context: context,
        builder: (context) {
          return OptionsMenu(
            contributedSpot: contributedSpot,
            pageRefresher: refresher,
            spotToEdit: spotToEdit,
          );
        });
  }

  void selectOption({
    required BuildContext context,
    required ContributedSpotOptions selectedOption,
  }) {
    Navigator.pop(context);
    if (selectedOption == ContributedSpotOptions.edit) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddEditSpotScreen(
              addEditPage: AppPage.editContribution,
              spotToEdit: spotToEdit,
              contributionsPageRefresher: pageRefresher),
        ),
      );
    } else if (selectedOption == ContributedSpotOptions.delete) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          buttonPadding: EdgeInsets.zero,
          title: Text(
            'Delete ' + contributedSpot.spotName,
            style: TextStyle(
              fontSize: percentageHeight(2.4),
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            '$contributedSpot will be deleted permanently',
            style: TextStyle(
              fontSize: percentageHeight(2.1),
            ),
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
                Container(
                  width: 1,
                  height: 30,
                  color: kGreyColor,
                ),
                Expanded(
                  child: MaterialButton(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: const Text('Confirm'),
                    onPressed: () {
                      Navigator.pop(context);
                      contributedSpots.remove(contributedSpot);
                      pageRefresher();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Wrap(
        children: <Widget>[
          const SizedBox(height: 10),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            leading: const Icon(Icons.edit),
            title: const Text('Edit Spot'),
            onTap: () => selectOption(
              context: context,
              selectedOption: ContributedSpotOptions.edit,
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            leading: const Icon(Icons.delete),
            title: const Text('Delete Spot'),
            onTap: () => selectOption(
              context: context,
              selectedOption: ContributedSpotOptions.delete,
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 2.5),
            leading: const Icon(Icons.cancel),
            title: const Text('Cancel'),
            onTap: () => selectOption(
              context: context,
              selectedOption: ContributedSpotOptions.cancel,
            ),
          ),
        ],
      ),
    );
  }
}

enum ContributedSpotOptions {
  edit,
  delete,
  cancel,
}
