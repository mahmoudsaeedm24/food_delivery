import 'package:flutter/material.dart';

class ChoiceTile extends StatelessWidget {
  const ChoiceTile({super.key, this.onTap, required this.leadingIcon, required this.title});
  final void Function()? onTap;
  final IconData leadingIcon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(leadingIcon),
      title: Text(title),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }
}
