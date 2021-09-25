import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';

import 'package:nowrth/constants/app_colors.dart';
import 'package:nowrth/constants/size_config.dart';

import 'package:nowrth/models/classes/contribution.dart';
import 'package:nowrth/models/classes/spot_location.dart';
import 'package:nowrth/models/classes/spot_type.dart';
import 'package:nowrth/models/enums/app_pages.dart';
import 'package:nowrth/providers/spot_type_provider.dart';

import 'package:nowrth/screens/contribution/add_edit_spot/components/background.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/custom_show_dialog.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/field_container.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/get_location.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/input_field.dart';
import 'package:nowrth/screens/contribution/contributions/contributions_screen.dart';

import 'package:nowrth/providers/contribution_provider.dart';
import 'package:nowrth/utils/image_utils.dart';

class AddEditContributionBody extends StatelessWidget {
  final AppPage curentPage;
  final int? contributionToEditId;
  final Function()? contributionsPageRefresher;

  const AddEditContributionBody({
    Key? key,
    required this.curentPage,
    this.contributionToEditId,
    this.contributionsPageRefresher,
  }) : super(key: key);

  Future<List> getAllFutures() async {
    List<SpotType> _spotTypes = await SpotTypesProvider().getSpotTypes();
    Contribution? _contributionToEdit = (curentPage == AppPage.editContribution)
        ? await ContributionProvider.getContribution(id: contributionToEditId!)
        : null;

    return [_spotTypes, _contributionToEdit];
  }

  @override
  Widget build(BuildContext context) {
    Contribution? contributionToEdit;
    late List<SpotType> spotTypes;
    bool reverseImageScroll = false;
    List<String> imageBase64s = [];

    Future<void> addImageBase64(BuildContext context) async {
      if ((imageBase64s.isEmpty) &&
          ((contributionToEdit == null)
              ? false
              : contributionToEdit!.imageBase64s.isNotEmpty)) {
        imageBase64s = contributionToEdit!.imageBase64s;
      } else if (imageBase64s.length >= 5) {
        customShowDialog(
          context,
          title: 'Limit Reached',
          description:
              'You cannot add more than five images for a single spot.',
          actions: [
            MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      } else {
        String _imageBase64 = await ImageUtils.pickImageBase64();
        imageBase64s.add(_imageBase64);
      }
    }

    SizeConfig().init(context);

    return FutureBuilder(
      future: getAllFutures(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        SpotType? dropdownValue;
        TextEditingController? titleController;
        TextEditingController? latitudeController;
        TextEditingController? longitudeController;
        TextEditingController? descriptionController;

        if (snapshot.connectionState != ConnectionState.waiting) {
          spotTypes = snapshot.data[0];
          contributionToEdit = snapshot.data[1];

          if (contributionToEdit != null) {
            imageBase64s = contributionToEdit!.imageBase64s;
          }

          dropdownValue = contributionToEdit?.spotType;

          titleController = TextEditingController(
            text: contributionToEdit?.name,
          );
          latitudeController = TextEditingController(
            text: contributionToEdit?.coordinates.latitude.toString(),
          );
          longitudeController = TextEditingController(
            text: contributionToEdit?.coordinates.longitude.toString(),
          );
          descriptionController = TextEditingController(
            text: contributionToEdit?.description,
          );
        }
        return Background(
          child: SingleChildScrollView(
            child: (snapshot.connectionState == ConnectionState.waiting)
                ? const Text('Loading')
                : Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FieldContainer(
                            margin: EdgeInsets.only(
                              bottom: 7.5,
                              top: (Platform.isLinux) ? 7.5 : 30,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            width: percentageWidth(44),
                            child: InputField(
                              hintText: 'Title',
                              controller: titleController,
                            ),
                          ),
                          SizedBox(width: percentageWidth(3)),
                          FieldContainer(
                            margin: EdgeInsets.only(
                              bottom: 7.5,
                              top: (Platform.isLinux) ? 7.5 : 30,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            width: percentageWidth(33),
                            child: StatefulBuilder(
                              builder: (BuildContext context,
                                  void Function(void Function())
                                      setSpotTypeState) {
                                return DropdownButton<SpotType>(
                                  items: spotTypes
                                      .map<DropdownMenuItem<SpotType>>(
                                        (SpotType value) =>
                                            DropdownMenuItem<SpotType>(
                                          value: value,
                                          child: Text(value.name),
                                        ),
                                      )
                                      .toList(),
                                  hint: const Text('Spot Type'),
                                  style: TextStyle(
                                    fontSize: percentageHeight(2),
                                    color: kTextColor,
                                  ),
                                  value: dropdownValue,
                                  isExpanded: true,
                                  onChanged: (SpotType? newValue) {
                                    setSpotTypeState(() {
                                      dropdownValue = newValue;
                                      spotTypes.remove(dropdownValue!);
                                      spotTypes.insert(0, dropdownValue!);
                                      SizeConfig().init(context);
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      StatefulBuilder(builder: (BuildContext context,
                          void Function(void Function()) setImageViewerState) {
                        return (imageBase64s.isNotEmpty)
                            ? Container(
                                alignment: Alignment.center,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  color: kPrimaryLightColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                height: percentageHeight(25),
                                width: percentageWidth(80),
                                child: Stack(
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      clipBehavior: Clip.antiAlias,
                                      reverse: reverseImageScroll,
                                      child: Row(
                                        children: <Widget>[
                                          ...List.generate(
                                            imageBase64s.length,
                                            (index) => Stack(
                                              children: [
                                                SizedBox(
                                                  width: percentageWidth(80),
                                                  child: Image(
                                                    image:
                                                        ImageUtils.base64ToImg(
                                                      imageBase64s[index],
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child: IconButton(
                                                    icon: const Icon(
                                                      Icons.close_rounded,
                                                    ),
                                                    color: kPrimaryLightColor,
                                                    iconSize:
                                                        percentageHeight(4),
                                                    splashRadius:
                                                        percentageHeight(3.5),
                                                    padding:
                                                        const EdgeInsets.all(2),
                                                    alignment:
                                                        Alignment.topCenter,
                                                    onPressed: () {
                                                      imageBase64s.remove(
                                                          imageBase64s[index]);
                                                      setImageViewerState(
                                                          () {});
                                                    },
                                                  ),
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
                                        onPressed: () {
                                          reverseImageScroll = true;
                                          addImageBase64(context);
                                          setImageViewerState(() {});
                                        },
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
                                        backgroundColor:
                                            kPrimaryColor.withOpacity(0.2),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          size: percentageHeight(5),
                                        ),
                                        onPressed: () {
                                          addImageBase64(context);
                                          setImageViewerState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                      }),
                      SizedBox(
                        width: percentageWidth(80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: FieldContainer(
                                padding: const EdgeInsets.only(
                                    bottom: 5, left: 15, right: 15),
                                child: InputField(
                                  hintText: 'Latitude',
                                  hintTextStyle: TextStyle(
                                    fontSize: percentageHeight(2.07),
                                  ),
                                  inputBorder: const UnderlineInputBorder(),
                                  isDense: true,
                                  controller: latitudeController,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: percentageWidth(3),
                            ),
                            Expanded(
                              flex: 2,
                              child: FieldContainer(
                                padding: const EdgeInsets.only(
                                  bottom: 5,
                                  left: 15,
                                  right: 15,
                                ),
                                child: InputField(
                                  hintText: 'Longitude',
                                  hintTextStyle: TextStyle(
                                    fontSize: percentageHeight(2.07),
                                  ),
                                  inputBorder: const UnderlineInputBorder(),
                                  isDense: true,
                                  controller: longitudeController,
                                ),
                              ),
                            ),
                            Expanded(
                              child: MaterialButton(
                                padding: EdgeInsets.symmetric(
                                  vertical: percentageHeight(
                                    (Platform.isLinux) ? 2.5 : 1.5,
                                  ),
                                ),
                                shape: const CircleBorder(),
                                color: kPrimaryColor,
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: kPrimaryLightColor,
                                ),
                                onPressed: () async {
                                  Coordinates? locationData =
                                      await getSpotLocation();
                                  latitudeController?.text =
                                      locationData!.latitude.toString();
                                  longitudeController?.text =
                                      locationData!.longitude.toString();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      FieldContainer(
                        child: InputField(
                          hintText: 'Description',
                          maxLines: 5,
                          controller: descriptionController,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 7.5),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minWidth: percentageWidth(79.5),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          color: kPrimaryColor,
                          textColor: Colors.white,
                          child: Text(
                            (curentPage == AppPage.addContribution)
                                ? 'Add Contribution'
                                : 'Update Contribution',
                          ),
                          onPressed: () async {
                            String _spotName = titleController!.text;
                            SpotType _spotType = dropdownValue!;
                            Coordinates _spotCoordinates = Coordinates(
                              latitude: double.parse(latitudeController!.text),
                              longitude: double.parse(
                                longitudeController!.text,
                              ),
                            );
                            String _spotDescription =
                                descriptionController?.text ?? '';

                            if (curentPage == AppPage.addContribution) {
                              ContributionListItem _contributionListItem =
                                  await ContributionProvider
                                      .addContributionRequest(
                                name: _spotName,
                                spotType: _spotType,
                                coordinates: _spotCoordinates,
                                description: _spotDescription,
                                imageBase64s: imageBase64s,
                              );

                              if (_contributionListItem.id > 0) {
                                customShowDialog(
                                  context,
                                  title: 'Contribution Request Sent',
                                  description:
                                      'Your request to add the spot has been sent successfully. It will be confirmed after validation.',
                                  actions: [
                                    MaterialButton(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ContributionsScreen(
                                              addedContribution:
                                                  _contributionListItem,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              }
                            } else if (curentPage == AppPage.editContribution) {
                              customShowDialog(
                                context,
                                title: 'Update Request Sent',
                                description:
                                    'Your request to update the spot has been sent successfully. It will be confirmed after validation.',
                                actions: [
                                  MaterialButton(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ContributionsScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            }
                            contributionsPageRefresher!();
                          },
                        ),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
