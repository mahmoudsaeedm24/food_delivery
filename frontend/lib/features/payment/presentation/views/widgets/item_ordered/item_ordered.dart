import 'package:flutter/material.dart';
import 'package:frontend/core/theme/my_text_styles.dart';

import 'product_ordered_list.dart';

class ItemOrdered extends StatelessWidget {
  const ItemOrdered({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        Text("Item Ordered", style: MyTextStyles.textHeadline3Style),
        const SizedBox(height: 10),
        const ProductOrderedList(),
      ],
    );
  }
}
