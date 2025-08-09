import 'package:flutter/material.dart';
import 'package:frontend/core/components/data/models/user/user_model.dart';
import 'package:frontend/core/utils/my_validator.dart';
import 'package:frontend/features/card/presentation/widgets/controllers.dart';
import 'package:frontend/features/personal_data/presentation/widgets/user_data_field.dart';
import 'package:frontend/features/personal_data/presentation/widgets/user_person_img.dart';

class UserDataForm extends StatelessWidget {
  const UserDataForm({
    super.key,
    required this.user,
    required this.formKey,
    required this.userControllers,
  });
  final UserControllers userControllers;
  final UserModel user;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 15,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserPersonImg(userModel: user),
          UserDataField(
            fieldTitle: "Full Name",
            validator: MyValidator.validateUserName,
            controller: userControllers.nameController,
          ),
          UserDataField(
            fieldTitle: "Date of birth",
            readOnly: true,
            // controller: userControllers.phoneController!,
          ),
          UserDataField(
            fieldTitle: "Gender",
            readOnly: true,
            // controller: userControllers.phoneController!,
          ),
          UserDataField(
            fieldTitle: "Phone",
            controller: userControllers.phoneController,
          ),
          UserDataField(
            fieldTitle: "Email",
            readOnly: true,
            controller: userControllers.emailController,
          ),
          // UserDataField(
          //   spacing: 10,
          //   fieldTitle: "",
          //   controller: userControllers.nameController!,
          // ),
        ],
      ),
    );
  }
}
