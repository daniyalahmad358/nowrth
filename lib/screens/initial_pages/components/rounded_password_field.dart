import 'package:flutter/material.dart';

import 'package:nowrth/screens/initial_pages/components/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final bool enabled;
  final String hintText;
  const RoundedPasswordField({
    Key? key,
    required this.controller,
    this.enabled = true,
    this.hintText = 'Password',
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  final FocusNode textFieldFocusNode = FocusNode();
  bool _obscured = true;
  IconData _visibilityIcon = Icons.visibility;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: _obscured,
        focusNode: textFieldFocusNode,
        controller: widget.controller,
        enabled: widget.enabled,
        decoration: InputDecoration(
          hintText: widget.hintText,
          icon: const Icon(
            Icons.vpn_key_rounded,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _visibilityIcon,
              color: Theme.of(context).disabledColor,
            ),
            splashRadius: 25,
            onPressed: () {
              setState(() {
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
      ),
    );
  }
}
