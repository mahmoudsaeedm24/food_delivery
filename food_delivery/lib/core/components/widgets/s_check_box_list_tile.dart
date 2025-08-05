import 'package:flutter/material.dart';

class SCheckBoxListTile extends StatelessWidget {
  const SCheckBoxListTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
  });
  final bool value;
  final void Function(bool?) onChanged;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.all(0),
      visualDensity: VisualDensity.compact,
      minVerticalPadding: 0,
      horizontalTitleGap: 0,
      leading: Checkbox(value: value, onChanged: onChanged),
      title: title,
    );
  }
}
