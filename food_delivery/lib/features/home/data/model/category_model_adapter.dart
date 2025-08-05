import 'package:food_delivery/core/utils/hive_utils/type_id.dart';
import 'package:food_delivery/features/home/data/model/category_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CategoryModelAdapter extends TypeAdapter<CategoryModel> {
  @override
  CategoryModel read(BinaryReader reader) {
    return CategoryModel(
      id: reader.read(),
      title: reader.readString(),
      iconCode: reader.readString(),
       createdAt: reader.read(), 
       updatedAt: reader.read(),
    );
  }

  @override
  int get typeId => TypeId.categoryModelID;

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer.write(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.iconCode);
    writer.write(obj.createdAt);
    writer.write(obj.updatedAt);
  }

}
