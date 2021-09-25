import 'package:flutter/material.dart';

import 'package:nowrth/constants/app_colors.dart';

import 'package:nowrth/screens/initial_pages/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController controller;
  const RoundedPasswordField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusNode textFieldFocusNode = FocusNode();
    bool _obscured = true;
    IconData _visibilityIcon = Icons.visibility;

    return TextFieldContainer(
      child: StatefulBuilder(builder: (_context, _setState) {
        return TextField(
          obscureText: _obscured,
          focusNode: textFieldFocusNode,
          controller: controller,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            hintText: 'Password',
            icon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _visibilityIcon,
              ),
              color: kPrimaryColor,
              splashRadius: 25,
              onPressed: () {
                _setState(() {
                  _obscured = !_obscured;
                  if (_obscured) {
                    _visibilityIcon = Icons.visibility;
                  } else if (!_obscured) {
                    _visibilityIcon = Icons.visibility_off;
                  }
                  if (textFieldFocusNode.hasPrimaryFocus) {
                    return;
                  }
                  textFieldFocusNode.canRequestFocus = false;
                });
              },
            ),
            border: InputBorder.none,
          ),
        );
      }),
    );
  }
}
