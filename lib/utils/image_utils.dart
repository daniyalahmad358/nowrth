import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_selector/file_selector.dart';

abstract class ImageUtils {
  static ImageProvider base64ToImg(String base64) {
    Uint8List bytes = base64Decode(base64);
    return Image.memory(bytes).image;
  }

  static List<ImageProvider> base64sToImgs(List<String> base64s) {
    List<ImageProvider> images = [];

    for (int i = 0; i < base64s.length; i++) {
      images.add(base64ToImg(base64s[i]));
    }
    return images;
  }

  static String fileToBase64(File imageFile) {
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

  static List<String> filesToBase64s(List<File> files) {
    List<String> base64s = [];

    for (int i = 0; i < files.length; i++) {
      base64s.add(fileToBase64(files[i]));
    }
    return base64s;
  }

  static Future<String> pickImageBase64() async {
    if (Platform.isAndroid || Platform.isIOS) {
      try {
        final XFile? imageXFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (imageXFile == null) {
          throw Exception();
        }

        File imageFile = File(imageXFile.path);
        return fileToBase64(imageFile);
      } on PlatformException {
        rethrow;
      }
    } else if (Platform.isLinux) {
      final XTypeGroup typeGroup = XTypeGroup(
        label: 'images',
        extensions: ['jpg', 'png'],
      );
      final List<XFile> imageFiles = await openFiles(
        acceptedTypeGroups: [typeGroup],
      );
      if (imageFiles.isEmpty) {
        throw Exception();
      }
      final XFile imageXFile = imageFiles[0];
      File imageFile = File(imageXFile.path);

      return fileToBase64(imageFile);
    } else {
      throw Exception();
    }
  }
}
