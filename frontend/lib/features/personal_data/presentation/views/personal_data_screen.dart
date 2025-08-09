import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/components/cubit/user_cubit.dart';
import 'package:frontend/core/components/data/models/user/user_model.dart';
import 'package:frontend/features/personal_data/presentation/controllers/cubit/image_change_cubit.dart';
import 'package:frontend/features/personal_data/presentation/controllers/update_user_cubit/update_user_cubit.dart';
import 'package:frontend/features/personal_data/presentation/widgets/user_data_form.dart';

import '../../../card/presentation/widgets/controllers.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({super.key});
  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  late UserControllers userControllers;

  @override
  void initState() {
    super.initState();
    userControllers = UserControllers(
      nameController: TextEditingController(),
      addressController: TextEditingController(),
      cityController: TextEditingController(),
      emailController: TextEditingController(),
      houseNoController: TextEditingController(),
      passwordController: TextEditingController(),
      phoneController: TextEditingController(),
    );
    context.read<UserCubit>().getUserInfo();
    // userControllers.initAllWithInitData(user: widget.user);
  }

  @override
  void dispose() {
    userControllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formState = GlobalKey<FormState>();
    return BlocBuilder<UserCubit, UserState>(
      buildWhen: (previous, current) => current is UserStateLoaded,

      builder: (context, state) {
        log("Personal data screen rebuilt bc UserState is loaded");
        if (state is UserStateLoaded) {
          userControllers.nameController.text = state.user.name;
          userControllers.emailController.text = state.user.email;
          userControllers.phoneController.text = state.user.phone ?? '';
          userControllers.addressController.text = state.user.address ?? '';
          userControllers.houseNoController.text = state.user.houseNo ?? '';
          userControllers.cityController.text = state.user.city ?? '';
        }
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(30),
              child: UserDataForm(
                user: state.user,
                formKey: formState,
                userControllers: userControllers,
              ),
            ),
          ),

          floatingActionButton: ElevatedButton(
            onPressed: () {
              if (formState.currentState!.validate()) {
                //TODO update fileds that will changes in UI
                UserModel userUpdated = state.user.copyWith(
                  name: userControllers.nameController.text,
                  phone: userControllers.phoneController.text,
                  img: context.read<ImageChangeCubit>().state,
                );
                context.read<UpdateUserCubit>().updateUser(
                  userModel: userUpdated,
                );
              }
            },
            child: Text("Save"),
          ),
        );
      },
    );
  }
}
