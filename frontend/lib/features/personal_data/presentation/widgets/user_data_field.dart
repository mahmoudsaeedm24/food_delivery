import 'package:flutter/material.dart';
import 'package:frontend/core/components/widgets/s_text_field_widget.dart';

class UserDataField extends StatelessWidget {
  const UserDataField({
    super.key,
    this.spacing = 5,
    required this.fieldTitle,
    this.controller,
    this.readOnly = false,
    this.validator,
  });
  final double spacing;
  final String fieldTitle;
  final TextEditingController? controller;
  final bool readOnly;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: spacing,
      children: [
        Text(fieldTitle),
        STextFieldWidget(
          controller: controller,
          readOnly: readOnly,
          validator: validator,
        ),
      ],
    );
  }
}
