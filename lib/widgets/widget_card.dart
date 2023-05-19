import 'package:flutter/material.dart';

class WidgetCard extends StatelessWidget {
  WidgetCard({required this.colour, this.cardChild, this.onPressed});

  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
