import 'package:flutter/material.dart';

class AuthFormWidget extends StatelessWidget {
  const AuthFormWidget({
    super.key,
    this.children = const <Widget>[],
    this.spaceBetweenChildren = 20, required this.formKey,
  });
  final double spaceBetweenChildren;
  final GlobalKey formKey;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),

      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: spaceBetweenChildren,
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}
