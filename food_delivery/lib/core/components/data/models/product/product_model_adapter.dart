import 'package:food_delivery/core/components/data/models/product/product_model.dart';
import 'package:food_delivery/core/utils/hive_utils/type_id.dart';
import 'package:food_delivery/features/home/data/model/category_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  ProductModel read(BinaryReader reader) {
    return ProductModel(
      id: reader.readString(),
      categoryId: reader.read() as CategoryModel,
      title: reader.readString(),
      price: reader.readDouble(),
      poster: reader.readString(),
      description: reader.readString(),
      images: reader.readStringList().cast<String>(),
      rating: reader.readDouble(),
    );
  }

  @override
  int get typeId => TypeId.productModelID;

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer.writeString(obj.id);
    writer.write<CategoryModel>(obj.categoryId);
    writer.writeString(obj.title);
    writer.writeDouble(obj.price);
    writer.writeString(obj.poster);
    writer.writeString(obj.description);
    writer.writeStringList(obj.images);
    writer.writeDouble(obj.rating);
  }
}
