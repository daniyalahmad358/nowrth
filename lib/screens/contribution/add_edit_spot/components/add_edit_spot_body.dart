import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:nowrth/constants/app_colors.dart';
import 'package:image_picker/image_picker.dart';

import 'package:nowrth/constants/size_config.dart';
import 'package:nowrth/constants/app_pages.dart';

import 'package:nowrth/screens/contribution/add_edit_spot/components/background.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/field_container.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/input_field.dart';

import 'package:nowrth/temp/spot/spot_type.dart';

class AddEditSpotBody extends StatefulWidget {
  final AppPage curentPage;

  AddEditSpotBody({
    Key? key,
    required this.curentPage,
    this.imagesFiles,
  });

  final List<File?>? imagesFiles;

  @override
  _AddEditSpotBodyState createState() => _AddEditSpotBodyState();
}

class _AddEditSpotBodyState extends State<AddEditSpotBody> {
  List<File?> imagesFiles = [];

  Future pickImage() async {
    if ((imagesFiles.length == 0) &&
        ((widget.imagesFiles == null)
            ? false
            : widget.imagesFiles!.length > 0)) {
      imagesFiles = widget.imagesFiles!;
    } else if (imagesFiles.length == 5) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          buttonPadding: EdgeInsets.zero,
          title: Text(
            'Limit Reached',
            style: TextStyle(
              fontSize: percentageHeight(2.4),
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            'You cannot add more than five images for a single spot',
            style: TextStyle(
              fontSize: percentageHeight(2.1),
            ),
          ),
          actions: [
            MaterialButton(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    } else {
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;

        final imageTemporary = File(image.path);
        setState(() => imagesFiles.add(imageTemporary));
        print('ADDING IMAGE');
      } on PlatformException catch (e) {
        print('Failed to pick image: $e');
      }
    }
  }

  String? dropdownValue;

  List<String> spotTypeValuesCopy = spotTypeValues;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FieldContainer(
                  margin: EdgeInsets.only(bottom: 7.5, top: 30),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: percentageWidth(44),
                  child: InputField(
                    hintText: 'Title',
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(width: percentageWidth(3)),
                FieldContainer(
                  margin: EdgeInsets.only(bottom: 7.5, top: 30),
                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                      'Spot Type',
                    ),
                    style: TextStyle(
                      fontSize: percentageHeight(2),
                      color: kTextColor,
                    ),
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
            (imagesFiles.length > 0)
                ? Container(
                    alignment: Alignment.center,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: percentageHeight(25),
                    width: percentageWidth(80),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          clipBehavior: Clip.antiAlias,
                          reverse: true,
                          child: Row(
                            children: <Widget>[
                              ...List.generate(
                                imagesFiles.length,
                                (index) => Stack(
                                  children: [
                                    SizedBox(
                                      width: percentageWidth(80),
                                      child: Image.file(imagesFiles[index]!),
                                    ),
                                    Positioned(
                                      top: 5,
                                      right: 5,
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.close_rounded,
                                          ),
                                          color: kPrimaryColor,
                                          iconSize: percentageHeight(4),
                                          splashRadius: percentageHeight(3.5),
                                          padding: EdgeInsets.all(2),
                                          alignment: Alignment.topCenter,
                                          onPressed: () {
                                            imagesFiles
                                                .remove(imagesFiles[index]!);
                                            setState(() {});
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 3,
                          right: 5,
                          child: FloatingActionButton(
                            mini: true,
                            backgroundColor: kPrimaryColor,
                            onPressed: pickImage,
                            child: Icon(
                              Icons.add,
                              color: kPrimaryLightColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : FieldContainer(
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
                            onPressed: () {
                              // ImagePicker.platform;
                              pickImage();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              width: percentageWidth(80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: FieldContainer(
                      padding: EdgeInsets.only(bottom: 5, left: 15, right: 15),
                      child: InputField(
                        hintText: 'Latitude',
                        hintTextStyle: TextStyle(
                          fontSize: percentageHeight(2.07),
                        ),
                        inputBorder: UnderlineInputBorder(),
                        isDense: true,
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  SizedBox(
                    width: percentageWidth(3),
                  ),
                  Expanded(
                    flex: 2,
                    child: FieldContainer(
                      padding: EdgeInsets.only(bottom: 5, left: 15, right: 15),
                      child: InputField(
                        hintText: 'Longitude',
                        hintTextStyle: TextStyle(
                          fontSize: percentageHeight(2.07),
                        ),
                        inputBorder: UnderlineInputBorder(),
                        isDense: true,
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      padding:
                          EdgeInsets.symmetric(vertical: percentageHeight(1.5)),
                      shape: CircleBorder(),
                      color: kPrimaryColor,
                      child: Icon(
                        Icons.location_on_outlined,
                        color: kPrimaryLightColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            FieldContainer(
              child: InputField(
                hintText: 'Description',
                maxLines: 5,
                onChanged: (String value) {},
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 7.5),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minWidth: percentageWidth(79.5),
                padding: EdgeInsets.symmetric(vertical: 15),
                color: kPrimaryColor,
                textColor: Colors.white,
                child: Text(
                  (widget.curentPage == AppPage.addContribution)
                      ? 'Add Contribution'
                      : 'Update Contribution',
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
