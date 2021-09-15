import 'package:flutter/material.dart';

import 'package:nowrth/constants/app_colors.dart';

import 'package:nowrth/screens/initial_pages/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final IconData icon;
  const RoundedInputField({
    Key? key,
    required this.controller,
    this.hintText,
    this.icon = Icons.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
