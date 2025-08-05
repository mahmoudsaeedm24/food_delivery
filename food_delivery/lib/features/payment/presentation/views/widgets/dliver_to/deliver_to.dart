import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/components/cubit/user_cubit.dart';
import 'package:food_delivery/core/components/data/models/user/user_model.dart';
import 'package:food_delivery/core/theme/my_text_styles.dart';

class DeliverTo extends StatelessWidget {
  const DeliverTo({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      buildWhen: (previous, current) => current is UserStateLoaded,
      builder: (context, state) {
        final UserModel userModel = state.user;
        log("UserState : ${state.runtimeType}");
        return Column(
          spacing: 15,
          mainAxisSize: MainAxisSize.min,

          children: [
            Text("Deliver To", style: MyTextStyles.textHeadline3Style),
            MyRow(title: "Name", value: userModel.name),
            MyRow(title: "Phone No", value: userModel.phone ?? ""),
            MyRow(title: "Address", value: userModel.address ?? ""),
            MyRow(title: "City", value: userModel.city ?? ""),
            MyRow(title: "house No", value: userModel.houseNo ?? ""),

            // Add more widgets here for address input, etc.
          ],
        );
      },
    );
  }
}

class MyRow extends StatelessWidget {
  const MyRow({
    super.key,
    required this.title,
    required this.value,
    this.valueTextStyle,
  });
  final String title;
  final String value;
  final TextStyle? valueTextStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value, style: valueTextStyle),
      ],
    );
  }
}
