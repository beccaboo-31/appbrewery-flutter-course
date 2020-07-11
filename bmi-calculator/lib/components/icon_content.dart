import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconWidget extends StatelessWidget {
  final IconData iconName;
  final String gender;
  IconWidget({this.iconName, this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconName,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          gender,
          style: kIconTextStyle,
        )
      ],
    );
  }
}