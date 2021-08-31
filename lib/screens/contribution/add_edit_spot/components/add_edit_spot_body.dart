import 'package:flutter/material.dart';
import 'package:nowrth/constants/app_colors.dart';

import 'package:nowrth/constants/size_config.dart';
import 'package:nowrth/constants/app_pages.dart';
import 'package:nowrth/models/spot.dart';

import 'package:nowrth/screens/contribution/add_edit_spot/components/background.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/field_container.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/input_field.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/roundButton.dart';

class AddEditSpotBody extends StatefulWidget {
  final AppPage curentPage;

  AddEditSpotBody({
    Key? key,
    required this.curentPage,
  });

  @override
  _AddEditSpotBodyState createState() => _AddEditSpotBodyState();
}

class _AddEditSpotBodyState extends State<AddEditSpotBody> {
  String? dropdownValue;

  List<String> spotTypeValuesCopy = spotTypeValues;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    TextStyle dropdownTextStyle = TextStyle(
      fontSize: percentageHeight(2),
      color: kTextColor,
    );

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FieldContainer(
                  horizontalPadding: 10,
                  width: percentageWidth(44),
                  child: InputField(
                    hintText: "Title",
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(width: percentageWidth(3)),
                FieldContainer(
                  horizontalPadding: 10,
                  width: percentageWidth(33),
                  child: DropdownButton<String>(
                    items: spotTypeValuesCopy
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text(
                      "Spot Type",
                      // style: dropdownTextStyle,
                    ),
                    style: dropdownTextStyle,
                    value: dropdownValue,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue;
                        spotTypeValuesCopy = spotTypeValues;
                        spotTypeValuesCopy.remove(dropdownValue!);
                        spotTypeValuesCopy.insert(0, dropdownValue!);
                        SizeConfig().init(context);
                      });
                    },
                  ),
                ),
              ],
            ),
            FieldContainer(
              height: percentageHeight(25),
              child: SizedBox(
                child: FittedBox(
                  child: SizedBox(
                    height: percentageHeight(20),
                    child: FloatingActionButton(
                      elevation: 0,
                      hoverElevation: 0,
                      focusElevation: 0,
                      highlightElevation: 0,
                      foregroundColor: kPrimaryColor,
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      backgroundColor: kPrimaryColor.withOpacity(0.2),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: percentageHeight(5),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
            FieldContainer(
              horizontalPadding: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.location_on_outlined,
                    color: kPrimaryColor,
                  ),
                  SizedBox(width: percentageWidth(3)),
                  RoundButton(text: "Enter Manually", press: () {}),
                  SizedBox(width: percentageWidth(3)),
                  RoundButton(text: "Detect", press: () {}),
                ],
              ),
            ),
            FieldContainer(
              child: InputField(
                hintText: "Description",
                maxLines: 6,
                onChanged: (String value) {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
