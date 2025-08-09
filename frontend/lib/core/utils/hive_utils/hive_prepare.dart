import 'package:frontend/core/components/data/models/cart/cart_model.dart';
import 'package:frontend/core/components/data/models/cart/cart_model_adapter.dart';
import 'package:frontend/core/components/data/models/product/product_model.dart';
import 'package:frontend/core/components/data/models/product/product_model_adapter.dart';
import 'package:frontend/core/components/data/models/user/user_model.dart';
import 'package:frontend/core/components/data/models/user/user_model_adapter.dart';
import 'package:frontend/core/utils/hive_utils/open_box_with_recovery.dart';
import 'package:frontend/features/home/data/model/category_model.dart';
import 'package:frontend/features/home/data/model/category_model_adapter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

enum Boxes { cartBox, productBox, userBox, categoryBox }

class HivePrepare {
  static Future initHive() async {
    final directory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(directory.path);
    Hive.registerAdapter<CategoryModel>(CategoryModelAdapter());
    Hive.registerAdapter<ProductModel>(ProductModelAdapter());
    Hive.registerAdapter<CartModel>(CartModelAdapter());
    Hive.registerAdapter<UserModel>(UserModelAdapter());
    await _openBoxes();
  }

  static Future _openBoxes() async {
    await HiveUtils.openBoxWithRecovery<ProductModel>(Boxes.productBox.name);
    await HiveUtils.openBoxWithRecovery<CartModel>(Boxes.cartBox.name);
    await HiveUtils.openBoxWithRecovery<UserModel>(Boxes.userBox.name);
    await HiveUtils.openBoxWithRecovery<CategoryModel>(Boxes.categoryBox.name);
  }

  static Future<void> closeBoxes() async {
    await Hive.close();
  }
}
