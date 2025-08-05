import 'package:food_delivery/core/components/data/models/user/user_model.dart';
import 'package:food_delivery/core/utils/hive_utils/type_id.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserModelAdapter implements TypeAdapter<UserModel> {
  @override
  UserModel read(BinaryReader reader) {
    return UserModel(
      id: reader.read(),
      name: reader.readString(),
      email: reader.readString(),
      password: reader.readString(),
      createdAt: reader.read(),
      address: reader.read(),
      city: reader.read(),
      houseNo: reader.read(),
      img: reader.read(),
      phone: reader.read(),
    );
  }

  @override
  int get typeId => TypeId.userModelID;

  @override
  void write(BinaryWriter writer, UserModel user) {
    writer.write(user.id);
    writer.writeString(user.name);
    writer.writeString(user.email);
    writer.writeString(user.password);
    writer.write(user.createdAt);
    writer.write(user.address);
    writer.write(user.city);
    writer.write(user.houseNo);
    writer.write(user.img);
    writer.write(user.phone);
  }
}
