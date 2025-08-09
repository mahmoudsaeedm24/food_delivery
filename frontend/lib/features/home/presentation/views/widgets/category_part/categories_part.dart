import 'package:flutter/material.dart';
import 'package:frontend/features/home/presentation/views/widgets/category_part/categories_list_widget.dart';

import '../../../../../../core/components/widgets/buttons/see_all_button.dart';
import '../../../../../../core/theme/my_text_styles.dart';

class CategoriesPart extends StatelessWidget {
  const CategoriesPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Find by Category", style: MyTextStyles.textHeadline2Style),
              SeeAllButton(),
            ],
          ),
          CategoriesListWidget(),
        ],
      ),
    );
  }
}
