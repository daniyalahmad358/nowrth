import 'package:flutter/material.dart';
import 'package:nowrth/constants/app_colors.dart';
import 'package:nowrth/constants/app_pages.dart';
import 'package:nowrth/constants/size_config.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/add_edit_spot_screen.dart';

void bringOtionsMenu({required BuildContext context}) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      backgroundColor: kPrimaryLightColor,
      context: context,
      builder: (context) {
        return OptionsMenu();
      });
}

class OptionsMenu extends StatelessWidget {
  const OptionsMenu({Key? key}) : super(key: key);

  void selectOption({
    required BuildContext context,
    required ContributedSpotOptions selectedOption,
  }) {
    Navigator.pop(context);
    if (selectedOption == ContributedSpotOptions.edit) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              AddEditSpotScreen(addEditPage: AppPage.editContribution),
        ),
      );
    } else if (selectedOption == ContributedSpotOptions.delete) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: percentageHeight(30),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Spot'),
            onTap: () => selectOption(
              context: context,
              selectedOption: ContributedSpotOptions.edit,
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete Spot'),
            onTap: () => selectOption(
              context: context,
              selectedOption: ContributedSpotOptions.delete,
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.cancel),
            title: Text('Cancel'),
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
