import 'package:flutter/material.dart';

import 'package:nowrth/screens/initial_pages/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final IconData icon;
  const RoundedInputField({
    Key? key,
    required this.controller,
    this.hintText,
    this.icon = Icons.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
            icon,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
