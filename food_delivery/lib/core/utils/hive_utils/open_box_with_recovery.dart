import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

class HiveUtils {
  ///! if box isn't open , open it
  ///! if box is open , return it
  ///! if box has courruption data , then delete it
  static Future<Box<T>> openBoxWithRecovery<T>(String boxName) async {
    try {
      // محاولة الفتح العادية
      if (!Hive.isBoxOpen(boxName)) {
        log("🔄️ The Box $T is being opened");
        final box = await Hive.openBox<T>(boxName);
        log("✅ The Box $T opened");
        return box;
      } else {
        log("✅ The Box $T opened");

        return Hive.box<T>(boxName);
      }
    } on Exception catch (e) {
      log("❌ Failed to open <$boxName>: $e");
      log("🛠 Attempting recovery...");
      rethrow;
      // try {
      //   // switch(T){
      //   // case CartModel _ : {
      //   //   CartModelValidation().isValid()
      //   // }
      //   // }
      //   // نفتح الصندوق كـ raw box (dynamic)
      //   final rawBox = await Hive.openBox(boxName);
      //   log("Data stored ${rawBox.values.toList()}");
      //   final Map<dynamic, T> validData = {};

      //   for (final key in rawBox.keys) {
      //     try {
      //       final item = rawBox.get(key);
      //       if (item is T) {
      //         validData[key] = item;
      //       }
      //     } catch (_) {
      //       // عنصر تالف → نتجاهله
      //     }
      //   }

      //   // نحذف الصندوق القديم ونرجعه نظيف
      //   await rawBox.deleteFromDisk();
      //   final cleanBox = await Hive.openBox<T>(boxName);
      //   await cleanBox.putAll(validData);

      //   log("✅ Recovery completed: ${validData.length} valid items restored.");
      //   return cleanBox;
      // } catch (e2) {
      //   log("❌ Recovery failed: $e2");

      //   // آخر محاولة:` حذف الصندوق بالكامل
      //   await Hive.deleteBoxFromDisk(boxName);
      //   log("🧹 Box <$boxName> deleted. Opening empty box.");
      //   return await Hive.openBox<T>(boxName);
      // }
    }
  }
}
