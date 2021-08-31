import 'package:flutter/material.dart';

import 'package:nowrth/constants/app_colors.dart';

// import 'package:nowrth/screens/contribution/add_edit_spot/components/field_container.dart';

class InputField extends StatelessWidget {
  final String? hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final int maxLines;
  const InputField({
    Key? key,
    required this.onChanged,
    this.hintText,
    this.maxLines = 1,
    this.icon = Icons.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
      ),
    );
  }
}
