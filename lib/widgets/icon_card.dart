import 'package:flutter/material.dart';

import '../constant.dart';

class IconCard extends StatelessWidget {
  IconCard({required this.icon, required this.label});

  IconData icon;
  String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
