import 'package:flutter/material.dart';
import 'package:nowrth/global/size_config.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight * 0.02),
      width: SizeConfig.screenWidth * 0.8,
      child: Row(
        children: const <Widget>[
          CustomDivider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'OR',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          CustomDivider(),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Divider(
        height: 1.5,
      ),
    );
  }
}
