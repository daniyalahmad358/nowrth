import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final int maxLines;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final EdgeInsetsGeometry? innerPad;
  final InputBorder? inputBorder;
  final bool? isDense;
  final TextEditingController? controller;

  const InputField({
    Key? key,
    required this.controller,
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
      controller: controller,
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
