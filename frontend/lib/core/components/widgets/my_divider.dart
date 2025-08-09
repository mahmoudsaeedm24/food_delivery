import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
    this.height = 1,
    this.color = Colors.black,
    this.startMargin = 1.0,
    this.endMargin = 1.0,
  });
  final double height;
  final Color color;
  final double startMargin;
  final double endMargin;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: height,
        // width: 5,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(left: startMargin, right: endMargin),
      ),
    );
  }
}
