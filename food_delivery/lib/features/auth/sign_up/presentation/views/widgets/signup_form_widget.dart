import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/components/data/models/user/user_model.dart';
import 'package:food_delivery/core/components/widgets/s_check_box_list_tile.dart';
import 'package:food_delivery/core/components/widgets/s_text_field_widget.dart';
import 'package:food_delivery/core/theme/my_button_styles.dart';
import 'package:food_delivery/features/auth/Presentation/views/widgets/auth_form_widget.dart';
import 'package:food_delivery/features/auth/sign_up/presentation/controllers/cubit/sign_up_cubit.dart';
import 'package:food_delivery/features/auth/sign_up/presentation/views/widgets/signup_button_widget.dart';
import 'package:food_delivery/core/utils/my_validator.dart';
import 'package:food_delivery/features/card/presentation/widgets/controllers.dart';

import '../../../../../../core/theme/my_text_styles.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({super.key});

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  bool isChecked = false;
  late UserControllers userControllers;
  // late TextEditingController _emailController,
  //     _passwordController,
  //     _userNameController,
  //     _phoneController;
  late GlobalKey<FormState> _formState;

  @override
  void initState() {
    super.initState();
    userControllers = UserControllers(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      nameController: TextEditingController(),
      phoneController: TextEditingController(),
      addressController: TextEditingController(),
      cityController: TextEditingController(),
      houseNoController: TextEditingController(),
    );
    _formState = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    userControllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      formKey: _formState,
      children: [
        STextFieldWidget(
          controller: userControllers.nameController,
          label: "User Name",
          keyboardType: TextInputType.name,
        ).copyWith(borderRadius: 1),
        STextFieldWidget(
          controller: userControllers.emailController,
          label: "Email address",
          validator: MyValidator.validateEmail,
          keyboardType: TextInputType.emailAddress,
        ),
        STextFieldWidget(
          controller: userControllers.passwordController,
          label: "Password",
          validator: MyValidator.validatePassword,
          isPasswordField: true,
        ),
        STextFieldWidget(
          controller: userControllers.phoneController,
          label: "Phone Number",
          validator: MyValidator.validateEgyPhoneNumber,
          keyboardType: TextInputType.number,
        ),

        SCheckBoxListTile(
          value: isChecked,
          onChanged: (currentChoice) {
            setState(() {
              isChecked = !isChecked;
            });
          },
          title: RichText(
            softWrap: true,

            text: TextSpan(
              children: [
                WidgetSpan(child: Text("I Agree with ")),
                WidgetSpan(
                  child: TextButton(
                    style: MyButtonStyles.linkButtonStyle,
                    onPressed: () {},
                    child: Text(
                      "Terms of Services",
                      style: MyTextStyles.textLinkStyle,
                    ),
                  ),
                ),
                WidgetSpan(child: Text(" And ")),
                WidgetSpan(
                  child: TextButton(
                    style: MyButtonStyles.linkButtonStyle,
                    onPressed: () {},
                    child: Text(
                      "Privacy Policy",
                      // style: MyTextStyles.textLinkStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // CheckboxListTile(
        //   value: isChecked,
        //   onChanged: (currentChoice) {
        //     setState(() {
        //       isChecked = !isChecked;
        //     });
        //   },
        //   title: RichText(
        //     text: TextSpan(
        //       children: [
        //         WidgetSpan(child: Text("I Agree with ")),
        //         WidgetSpan(
        //           child: TextButton(
        //             style: linkButtonStyle,
        //             onPressed: () {},
        //             child: Text("Terms of Services", style: textLinkStyle),
        //           ),
        //         ),
        //         WidgetSpan(child: Text(" And ")),
        //         WidgetSpan(
        //           child: TextButton(
        //             style: linkButtonStyle,
        //             onPressed: () {},
        //             child: Text("Privacy Policy", style: textLinkStyle),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),

        //   // title: Row(

        //   //   children: [
        //   //     Text("I Agree with "),
        //   //     TextButton(
        //   //       onPressed: () {},
        //   //       child: Text("Terms of Services", style: textLinkStyle),
        //   //     ),
        //   //     Text(" And "),
        //   //     TextButton(
        //   //       onPressed: () {},
        //   //       child: Text("Privacy Policy", style: textLinkStyle),
        // ),
        SignupButtonWidget(
          policyChecked: isChecked,
          onPressed: () async {
            UserModel user = UserModel(
              name: userControllers.nameController.text.trim(),
              email: userControllers.emailController.text.trim(),
              password: userControllers.passwordController.text,
              phone: userControllers.phoneController.text.trim(),
            );

            if (_formState.currentState!.validate()) {
              await context.read<SignUpCubit>().signup(user);
            }
          },
        ),
      ],
    );
  }
}
