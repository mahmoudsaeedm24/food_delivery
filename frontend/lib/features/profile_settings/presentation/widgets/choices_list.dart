import 'package:flutter/material.dart';
import 'package:frontend/core/utils/router.dart';
import 'package:frontend/features/profile_settings/presentation/widgets/choice_tile.dart';

class ChoicesList extends StatelessWidget {
  const ChoicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Profile"),
        ChoiceTile(
          leadingIcon: Icons.person_2_outlined,
          title: "Personal Data",
          onTap: () {
            Navigator.pushNamed(context, MyPages.personalEditScreen);
          },
        ),
        ChoiceTile(leadingIcon: Icons.settings, title: "Settings"),
        ChoiceTile(
          leadingIcon: Icons.person_2_outlined,
          title: "Personal Data",
        ),

        Text("Support"),
        ChoiceTile(
          leadingIcon: Icons.person_2_outlined,
          title: "Personal Data",
        ),
        ChoiceTile(
          leadingIcon: Icons.person_2_outlined,
          title: "Personal Data",
        ),
        ChoiceTile(
          leadingIcon: Icons.person_2_outlined,
          title: "Personal Data",
        ),
      ],
    );
  }
}
