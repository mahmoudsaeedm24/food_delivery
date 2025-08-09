import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.buttonTitleOne,
    required this.buttonTitleTwo,
    this.onPressedOne,
    this.onPressedTwo,
    this.buttonStyleOne,
    this.buttonStyleTwo,
  });
  final String title, content, buttonTitleOne, buttonTitleTwo;
  final void Function()? onPressedOne, onPressedTwo;
  final ButtonStyle? buttonStyleOne, buttonStyleTwo;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      title: Text(title),
      content: Text(content),
      actions: [
        ElevatedButton(
          onPressed: onPressedOne,
          style: buttonStyleOne,
          child: Text(buttonTitleOne),
        ),
        ElevatedButton(
          onPressed: onPressedTwo,
          style: buttonStyleTwo,
          child: Text(buttonTitleTwo),
        ),
      ],
    );
  }
}
