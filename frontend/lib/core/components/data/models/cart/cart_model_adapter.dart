import 'package:frontend/core/components/data/models/cart/cart_model.dart';
import 'package:frontend/core/components/data/models/product/product_model.dart';
import 'package:frontend/core/utils/hive_utils/type_id.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartModelAdapter extends TypeAdapter<CartModel> {
  @override
  CartModel read(BinaryReader reader) {
    return CartModel(
      id: reader.readString(),
      productModel: reader.read() as ProductModel,
      quantity: reader.readInt(),
    );
  }

  @override
  int get typeId => TypeId.cartModelID;

  @override
  void write(BinaryWriter writer, CartModel obj) {
    writer.writeString(obj.id);
    writer.write(obj.productModel);
    writer.writeInt(obj.quantity);
  }
}
