import 'package:frontend/core/components/data/models/product/product_model.dart';
import 'package:frontend/core/utils/hive_utils/open_box_with_recovery.dart';
import 'package:frontend/core/utils/hive_utils/validation/validate_model_interface.dart';

class ProductModelValidation extends ValidateModelInterface<ProductModel> {
  @override
  bool isValid(ProductModel product) {
    return product.categoryId.id!.isNotEmpty &&
        product.title.isNotEmpty &&
        product.poster.isNotEmpty &&
        product.description.isNotEmpty &&
        product.price >= 0 &&
        product.rating >= 0 &&
        product.images.isNotEmpty;
  }

  @override
  Future<List<ProductModel>> loadValidateItems(String boxName) async {
    final box = await HiveUtils.openBoxWithRecovery<ProductModel>(boxName);

    final rowItems = box.values.toList();
    final itemsValid = validateItems(rowItems);

    if (rowItems.length != itemsValid.length) {
      final allKeys = box.keys.toList();
      for (final key in allKeys) {
        final item = box.get(key);
        if (item == null || !isValid(item)) {
          await box.delete(key);
        }
      }
    }

    return itemsValid;
  }
}
