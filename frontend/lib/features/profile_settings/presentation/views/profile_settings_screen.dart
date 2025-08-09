import 'package:flutter/material.dart';
import 'package:frontend/core/components/data/data_sources/secure_data_base/secure_data_base.dart';
import 'package:frontend/core/components/data/models/user/user_model.dart';
import 'package:frontend/core/components/widgets/my_alert_dialog.dart';
import 'package:frontend/core/theme/my_button_styles.dart';
import 'package:frontend/core/theme/my_text_styles.dart';
import 'package:frontend/core/utils/router.dart';
import 'package:frontend/features/profile_settings/presentation/widgets/choices_list.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserModel.mock();
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => MyAlertDialog(
              title: "Sign Out",
              content: "Do you want to log out",
              buttonTitleOne: "Cancel",
              buttonTitleTwo: "Log Out",
              buttonStyleOne: MyButtonStyles.mainButtonStyle.copyWith(
                backgroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              buttonStyleTwo: MyButtonStyles.mainButtonStyle,
              onPressedOne: () => Navigator.pop(context),
              onPressedTwo: () async {
                await SecureDataBase.removeToken();
                await Navigator.pushNamedAndRemoveUntil(
                  context,
                  MyPages.loginScreen,
                  (route) => false,
                );
              },
            ),
          );
        },
        label: Text("Sign Out"),
        icon: Icon(Icons.logout),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //TODO image converter widget
            ],
          ),
          Text(userModel.name, style: MyTextStyles.textHeadline2Style),
          Text(userModel.email),
          Divider(),
          ChoicesList(),
        ],
      ),
    );
  }
}
