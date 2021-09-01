import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'dart:typed_data';

Image base64ToImg(String base64Str) {
  Uint8List bytes = base64.decode(base64Str.split("base64,")[1]);
  return Image.memory(bytes);
}
