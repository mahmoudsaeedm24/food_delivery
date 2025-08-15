import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar (SnackBar snackBar)=>  ScaffoldMessenger.of(this).showSnackBar(snackBar);
}