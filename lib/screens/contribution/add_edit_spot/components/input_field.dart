import 'package:flutter/material.dart';

import 'package:nowrth/constants/app_colors.dart';
// import 'package:nowrth/constants/size_config.dart';

class InputField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final int maxLines;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final EdgeInsetsGeometry? innerPad;
  final InputBorder? inputBorder;
  final bool? isDense;

  const InputField({
    Key? key,
    required this.onChanged,
    this.maxLines = 1,
    this.hintText,
    this.hintTextStyle,
    this.innerPad,
    this.inputBorder,
    this.isDense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextField readyTextField = TextField(
      onChanged: onChanged,
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: innerPad,
        hintText: hintText,
        hintStyle: hintTextStyle,
        border: inputBorder ?? InputBorder.none,
        isDense: isDense,
      ),
    );

    return readyTextField;
  }
}
