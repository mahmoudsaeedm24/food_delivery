import 'package:flutter/material.dart';


class Controllers {
  final TextEditingController cardHolderController;
  final TextEditingController cardNumberController;
  final TextEditingController expireController;
  final TextEditingController cvvController;

  Controllers({
    required this.cardHolderController,
    required this.cardNumberController,
    required this.expireController,
    required this.cvvController,
  });
}

class UserControllers {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController houseNoController;
  final TextEditingController cityController;

  UserControllers({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
    required this.addressController,
    required this.houseNoController,
    required this.cityController,
  });

  // void initAll() {
  //   nameController = TextEditingController();
  //   emailController = TextEditingController();
  //   passwordController = TextEditingController();
  //   phoneController = TextEditingController();
  //   addressController = TextEditingController();
  //   houseNoController = TextEditingController();
  //   cityController = TextEditingController();
  // }

  // void initAllWithInitData({required UserModel user}) {
  //   nameController = TextEditingController(text: user.name);
  //   emailController = TextEditingController(text: user.email);
  //   passwordController = TextEditingController(text: user.password);
  //   phoneController = TextEditingController(text: user.phone);
  //   addressController = TextEditingController(text: user.address);
  //   houseNoController = TextEditingController(text: user.houseNo);
  //   cityController = TextEditingController(text: user.city);
  // }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    addressController.dispose();
    houseNoController.dispose();
    cityController.dispose();
  }

  // final TextEditingController? Controller;
}
