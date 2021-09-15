import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:nowrth/constants/app_colors.dart';
import 'package:image_picker/image_picker.dart';

import 'package:nowrth/constants/size_config.dart';
import 'package:nowrth/models/enums/app_pages.dart';
import 'package:nowrth/models/classes/contribution.dart';
import 'package:nowrth/models/classes/spot.dart';
import 'package:nowrth/models/classes/spot_location.dart';
import 'package:nowrth/providers/contribution_provider.dart';

import 'package:nowrth/screens/contribution/add_edit_spot/components/background.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/custom_show_dialog.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/field_container.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/input_field.dart';

import 'package:nowrth/models/enums/spot_type.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/location_screen.dart';
import 'package:nowrth/screens/contribution/contributions/contributions_screen.dart';
import 'package:nowrth/temp/spot/spot.dart';
import 'package:nowrth/temp/user_data.dart';
import 'package:flutter/foundation.dart';
import 'package:file_selector/file_selector.dart';
// import 'package:nowrth/utils/file_picker.dart';

class AddEditSpotBody extends StatefulWidget {
  final AppPage curentPage;
  final Spot? spotToEdit;
  final Function()? contributionsPageRefresher;

  const AddEditSpotBody({
    Key? key,
    required this.curentPage,
    this.spotToEdit,
    this.contributionsPageRefresher,
  }) : super(key: key);

  List<String> base64Images(imagesToShowFiles) {
    return [
      ...List<String>.generate(imagesToShowFiles.length, (index) {
        List<int> imageBytes = imagesToShowFiles[0].readAsBytesSync();
        String base64Image = base64Encode(imageBytes);

        return base64Image;
      }),
    ];
  }

  @override
  _AddEditSpotBodyState createState() => _AddEditSpotBodyState();
}

class _AddEditSpotBodyState extends State<AddEditSpotBody> {
  List<Image> imagesToShow = [];
  TextEditingController? titleController;
  TextEditingController? latitudeController;
  TextEditingController? longitudeController;
  TextEditingController? descriptionController;
  bool reverseImageScroll = false;
  List<File> imagesToShowFiles = [];

  Future<void> pickImageFile() async {
    if ((imagesToShow.isEmpty) &&
        ((widget.spotToEdit == null)
            ? false
            : widget.spotToEdit!.images.isNotEmpty)) {
      imagesToShow = widget.spotToEdit!.images;
    } else if (imagesToShow.length >= 5) {
      customShowDialog(
        context,
        title: 'Limit Reached',
        description: 'You cannot add more than five images for a single spot.',
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
      if (Platform.isAndroid || Platform.isIOS) {
        try {
          final XFile? imageXFile =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          if (imageXFile == null) return;

          File imageFile = File(imageXFile.path);
          Image imageTemporary = Image.file(imageFile);
          setState(() {
            imagesToShow.add(imageTemporary);
            imagesToShowFiles.add(imageFile);
          });
        } on PlatformException catch (e) {
          customShowDialog(
            context,
            title: 'Failed',
            description: 'Failed to pick image: $e',
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
        }
      } else if (Platform.isLinux) {
        final XTypeGroup typeGroup = XTypeGroup(
          label: 'images',
          extensions: ['jpg', 'png'],
        );
        final List<XFile> imageFiles =
            await openFiles(acceptedTypeGroups: [typeGroup]);
        if (imageFiles.isEmpty) {
          // Operation was canceled by the user.
          return;
        }
        final XFile imageXFile = imageFiles[0];
        File imageFile = File(imageXFile.path);

        Image imageTemporary = Image.file(imageFile);
        setState(() {
          imagesToShow.add(imageTemporary);
          imagesToShowFiles.add(imageFile);
        });
      }
    }
  }

  String? dropdownValue;

  List<String> spotTypeValuesCopy = spotTypeValues;

  @override
  void initState() {
    super.initState();

    dropdownValue = widget.spotToEdit?.spotType.value;

    titleController = TextEditingController(text: widget.spotToEdit?.spotName);
    latitudeController =
        TextEditingController(text: widget.spotToEdit?.spotLocation.latitude);
    longitudeController =
        TextEditingController(text: widget.spotToEdit?.spotLocation.longitude);
    descriptionController =
        TextEditingController(text: widget.spotToEdit?.description);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.spotToEdit != null) imagesToShow = widget.spotToEdit!.images;

    SizeConfig().init(context);

    return Background(
      child: SingleChildScrollView(
        child: Column(
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
                  child: DropdownButton<String>(
                    items: spotTypeValuesCopy
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: const Text(
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
            (imagesToShow.isNotEmpty)
                ? Container(
                    alignment: Alignment.center,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
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
                                imagesToShow.length,
                                (index) => Stack(
                                  children: [
                                    SizedBox(
                                      width: percentageWidth(80),
                                      child: Image(
                                        image: imagesToShow[index].image,
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
                                        iconSize: percentageHeight(4),
                                        splashRadius: percentageHeight(3.5),
                                        padding: const EdgeInsets.all(2),
                                        alignment: Alignment.topCenter,
                                        onPressed: () {
                                          imagesToShow
                                              .remove(imagesToShow[index]);
                                          setState(() {});
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
                              pickImageFile();
                            },
                            child: const Icon(
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
                              pickImageFile();
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
                      padding:
                          const EdgeInsets.only(bottom: 5, left: 15, right: 15),
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
                      padding:
                          const EdgeInsets.only(bottom: 5, left: 15, right: 15),
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
                          vertical:
                              percentageHeight((Platform.isLinux) ? 2.5 : 1.5)),
                      shape: const CircleBorder(),
                      color: kPrimaryColor,
                      child: const Icon(
                        Icons.location_on_outlined,
                        color: kPrimaryLightColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LocationScreen(),
                          ),
                        );
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
                  (widget.curentPage == AppPage.addContribution)
                      ? 'Add Contribution'
                      : 'Update Contribution',
                ),
                onPressed: () async {
                  String spotName = titleController!.text;
                  SpotType spotType = SpotType.values.firstWhere(
                    (element) => element.value == dropdownValue,
                  );
                  SpotLocation spotLocation = SpotLocation(
                    latitude: latitudeController!.text,
                    longitude: longitudeController!.text,
                  );
                  String? spotDescription = descriptionController?.text;

                  // print(imageBytes);
                  Contribution contribution = Contribution(
                    spotName: spotName,
                    spotTypeString: spotType.value,
                    latitude: spotLocation.latitude,
                    longitude: spotLocation.longitude,
                    imagesBase64: widget.base64Images(imagesToShowFiles),
                  );

                  if (widget.curentPage == AppPage.addContribution) {
                    Spot newSpot = Spot(
                      spotID: UniqueKey(),
                      spotName: spotName,
                      spotType: spotType,
                      spotLocation: spotLocation,
                      rating: 0,
                      images: imagesToShow,
                      description: spotDescription,
                    );

                    ContributionProvider().addContributionRequest(contribution);

                    allSpots.add(newSpot);
                    contributedSpots.add(newSpot);

                    // ContributionProvider

                    customShowDialog(
                      context,
                      title: 'Contribution Request Sent',
                      description:
                          'Your request to add the spot has been sent successfully. It will be confirmed after validation.',
                      actions: [
                        MaterialButton(
                          padding: const EdgeInsets.symmetric(vertical: 15),
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
                  } else if (widget.curentPage == AppPage.editContribution) {
                    int allIndex = allSpots.indexWhere((element) =>
                        element.spotID == widget.spotToEdit!.spotID);

                    Spot updatedSpot = allSpots[allIndex];
                    updatedSpot.spotName = spotName;
                    updatedSpot.spotType = spotType;
                    updatedSpot.spotLocation = spotLocation;
                    updatedSpot.images = imagesToShow;
                    updatedSpot.description = spotDescription;

                    int contributedIndex = contributedSpots.indexWhere(
                      (element) => element.spotID == updatedSpot.spotID,
                    );

                    int likedIndex = likedSpots.indexWhere(
                      (element) => element.spotID == updatedSpot.spotID,
                    );

                    int topIndex = topTravelSpots.indexWhere(
                      (element) => element.spotID == updatedSpot.spotID,
                    );

                    contributedSpots[contributedIndex] = updatedSpot;

                    if (likedIndex != -1) likedSpots[likedIndex] = updatedSpot;
                    if (topIndex != -1) topTravelSpots[topIndex] = updatedSpot;

                    customShowDialog(
                      context,
                      title: 'Update Request Sent',
                      description:
                          'Your request to update the spot has been sent successfully. It will be confirmed after validation.',
                      actions: [
                        MaterialButton(
                          padding: const EdgeInsets.symmetric(vertical: 15),
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
                  widget.contributionsPageRefresher!();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
