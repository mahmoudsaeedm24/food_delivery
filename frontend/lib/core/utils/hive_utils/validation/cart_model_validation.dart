import 'package:frontend/core/components/data/models/cart/cart_model.dart';
import 'package:frontend/core/utils/hive_utils/open_box_with_recovery.dart';
import 'package:frontend/core/utils/hive_utils/validation/product_model_validation.dart';
import 'package:frontend/core/utils/hive_utils/validation/validate_model_interface.dart';

class CartModelValidation extends ValidateModelInterface<CartModel> {
  @override
  bool isValid(CartModel item) {
    return item.id.isNotEmpty &&
        item.quantity > 0 &&
        ProductModelValidation().isValid(item.productModel);
  }

  @override
  Future<List<CartModel>> loadValidateItems(String boxName) async {
    final box = await HiveUtils.openBoxWithRecovery<CartModel>(boxName);

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
