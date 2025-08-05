import 'package:flutter/material.dart';
import 'package:food_delivery/core/components/data/models/product/product_model.dart';
import 'package:food_delivery/core/theme/colors.dart';

import '../../../../../../core/components/widgets/buttons/loved_button.dart';
import '../../../../../../core/theme/my_text_styles.dart';
import '../product_images_viewer.dart';

class ProductImageCarousel extends StatelessWidget {
  const ProductImageCarousel({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      title: Text("About This Menu", style: MyTextStyles.textHeadline3Style.copyWith(color: Colors.white)),
      centerTitle: true,
      actionsPadding: EdgeInsets.symmetric(horizontal: 20),

      // pinned: true,
      actions: [CartButton(productModel: productModel)],
      forceMaterialTransparency: true,
      // shape: CircleBorder(),
      // leadingWidth: 80,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Align(
          // alignment: Alignment.bottomRight,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: MyColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          ),
        ),
      ),
      stretch: true, // هذا المهم

      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground, // يخلي الصورة تكبر عند السحب
        ],
        background: ProductImagesViewer(productModel: productModel),
      ),
    );
  }
}
