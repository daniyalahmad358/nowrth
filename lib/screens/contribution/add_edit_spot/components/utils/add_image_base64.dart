import 'package:flutter/material.dart';
import 'package:nowrth/models/classes/contribution.dart';
import 'package:nowrth/screens/contribution/add_edit_spot/components/custom_show_dialog.dart';
import 'package:nowrth/utils/image_utils.dart';

Future<void> addImageBase64({
  required BuildContext context,
  required void Function(void Function()) setCallerState,
  Contribution? contributionToEdit,
  required List<String> imageBase64s,
}) async {
  if ((imageBase64s.isEmpty) &&
      ((contributionToEdit == null)
          ? false
          : contributionToEdit.imageBase64s.isNotEmpty)) {
    imageBase64s = contributionToEdit.imageBase64s;
  } else if (imageBase64s.length >= 5) {
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
    String _imageBase64 = await ImageUtils.pickImageBase64();
    setCallerState(() {
      imageBase64s.add(_imageBase64);
    });
  }
}
