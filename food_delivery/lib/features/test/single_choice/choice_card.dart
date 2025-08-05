import 'package:flutter/material.dart';

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({super.key, required this.isActive, this.onTap});
  final bool isActive;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: isActive ? Colors.white : Colors.black),
        ),
        child: isActive ? Icon(Icons.check) : null,
      ),
    );
  }
}
