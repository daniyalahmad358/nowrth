import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? defaultSize;
  static Orientation orientation = _mediaQueryData!.orientation;
  static double screenWidth = _mediaQueryData!.size.width;
  static double screenHeight = _mediaQueryData!.size.height;
  static double screenProduct = screenHeight * screenWidth;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    // 345
    screenHeight = _mediaQueryData!.size.height;
    // 615

    screenProduct = screenHeight * screenWidth;
    orientation = _mediaQueryData!.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // Our designer use iPhone 11 Pro, that's why we use 815.0
  // return (inputHeight / 815.0) * screenHeight;
  return (inputHeight / 615) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 414 is the layout width that designer use or you can say iPhone 11 Pro width
  return (inputWidth / 345) * screenWidth;
}

double percentageHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight * screenHeight) / 100;
}

double percentageWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth * screenWidth) / 100;
}

// For add free space vertically
class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({
    Key? key,
    this.of = 25,
  }) : super(key: key);

  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(of),
    );
  }
}
