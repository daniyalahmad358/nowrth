import 'dart:io';

import 'package:flutter/material.dart';

import 'package:nowrth/global/size_config.dart'; // TODO: When server is up

import 'package:nowrth/models/classes/contribution.dart';
import 'package:nowrth/models/classes/spot_location.dart';
import 'package:nowrth/models/classes/spot_type.dart';
import 'package:nowrth/models/enums/app_pages.dart';
import 'package:nowrth/providers/spot_type_provider.dart';

import 'package:nowrth/screens/contribution/add_edit_spot/components/backgrounded.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/custom_show_dialog.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/field_container.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/get_location.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/input_field.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/utils/add_image_base64.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/utils/successful_route.dart';

import 'package:nowrth/providers/contribution_provider.dart';
import 'package:nowrth/utils/image_utils.dart';

class AddContributionBody extends StatelessWidget {
  final AppPage currentPage;
  final List<ContributionListItem> contributionListItems;
  final Function()? contributionsPageRefresher;

  const AddContributionBody({
    Key? key,
    required this.currentPage,
    required this.contributionListItems,
    this.contributionsPageRefresher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late List<ContributionListItem> _contributionListItems =
        contributionListItems;
    late List<SpotType> spotTypes;
    late List<SpotType> spotTypesToShow;
    late bool reverseImageScroll = false;
    late List<String> imageBase64s = [];
    SizeConfig().init(context);

    return FutureBuilder(
      future: SpotTypesProvider().getSpotTypes(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        late SpotType dropdownValue;
        TextEditingController titleController = TextEditingController();
        TextEditingController latitudeController = TextEditingController();
        TextEditingController longitudeController = TextEditingController();
        TextEditingController addressController = TextEditingController();
        TextEditingController descriptionController = TextEditingController();

        if (snapshot.connectionState != ConnectionState.waiting) {
          spotTypes = snapshot.data;
          spotTypesToShow = [...spotTypes];
          dropdownValue = spotTypesToShow[0];
        }
        return Backgrounded(
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
                                  items: spotTypesToShow
                                      .map<DropdownMenuItem<SpotType>>(
                                        (SpotType _spotType) =>
                                            DropdownMenuItem<SpotType>(
                                          value: _spotType,
                                          child: Text(_spotType.name),
                                        ),
                                      )
                                      .toList(),
                                  hint: const Text('Spot Type'),
                                  style: TextStyle(
                                    fontSize: percentageHeight(2),
                                  ),
                                  value: dropdownValue,
                                  isExpanded: true,
                                  onChanged: (SpotType? newValue) {
                                    setSpotTypeState(() {
                                      spotTypesToShow = [...spotTypes];
                                      spotTypesToShow.remove(dropdownValue);
                                      dropdownValue = newValue!;
                                      spotTypesToShow.insert(0, dropdownValue);
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
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
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
                                                        imageBase64s[index],
                                                      );
                                                      setImageViewerState(
                                                        () {},
                                                      );
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
                                        onPressed: () {
                                          reverseImageScroll = true;
                                          addImageBase64(
                                            context: context,
                                            setCallerState: setImageViewerState,
                                            imageBase64s: imageBase64s,
                                          );
                                        },
                                        child: const Icon(
                                          Icons.add,
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
                                        // focusColor: Colors.transparent,
                                        // splashColor: Colors.transparent,
                                        // hoverColor: Colors.transparent,
                                        // backgroundColor:
                                        // kPrimaryColor.withOpacity(0.2),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          size: percentageHeight(5),
                                        ),
                                        onPressed: () {
                                          addImageBase64(
                                            context: context,
                                            setCallerState: setImageViewerState,
                                            imageBase64s: imageBase64s,
                                          );
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
                                child: const Icon(
                                  Icons.location_on_outlined,
                                ),
                                onPressed: () async {
                                  Coordinates? locationData =
                                      await getSpotLocation();
                                  latitudeController.text =
                                      locationData!.latitude.toString();
                                  longitudeController.text =
                                      locationData.longitude.toString();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      FieldContainer(
                        margin: EdgeInsets.only(
                          bottom: 7.5,
                          top: (Platform.isLinux) ? 7.5 : 30,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: percentageWidth(80),
                        child: InputField(
                          hintText: 'Address',
                          controller: addressController,
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
                          child: const Text('Add Contribution'),
                          onPressed: () async {
                            final int? firstCommaIndex =
                                addressController.text.indexOf(', ');

                            String _spotName = titleController.text;
                            SpotType _spotType = dropdownValue;
                            Coordinates _spotCoordinates = Coordinates(
                              latitude: double.parse(latitudeController.text),
                              longitude: double.parse(
                                longitudeController.text,
                              ),
                            );
                            Address _spotAddress = Address(
                              cityOrTown: addressController.text.substring(
                                0,
                                firstCommaIndex,
                              ),
                              country: addressController.text.substring(
                                firstCommaIndex! + 2,
                              ),
                            );
                            String _spotDescription =
                                descriptionController.text;

                            ContributionListItem _contributionListItem =
                                await ContributionProvider
                                    .addContributionRequest(
                              name: _spotName,
                              spotType: _spotType,
                              coordinates: _spotCoordinates,
                              address: _spotAddress,
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
                                      successfulRoute(
                                        context: context,
                                        list: _contributionListItems,
                                        itemToAdd: _contributionListItem,
                                      );
                                    },
                                  ),
                                ],
                              );
                            }
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
