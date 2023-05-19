import 'package:flutter/material.dart';

import '../constant.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    this.onTap,
    required this.buttonTitle,
  });

  final VoidCallback? onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          buttonTitle,
          style: kBottomButtonStyle,
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
