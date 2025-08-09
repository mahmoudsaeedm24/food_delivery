import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Permissions {

  //? check the service of GPS 
static Future<bool> checkLocationService(BuildContext context) async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    await showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text("الموقع مقفول"),
        content: Text("من فضلك فعّل الـ GPS من إعدادات الجهاز."),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext, false);
              await AppSettings.openAppSettings(type: AppSettingsType.location);
            },
            child: Text("فتح الإعدادات"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext, false);
            },
            child: Text("إلغاء"),
          ),
        ],
      ),
    );
    // فحص بعد الرجوع
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
  }

  return serviceEnabled;
}

static Future<bool> checkLocationPermission(BuildContext context) async {
  // 1. فحص GPS
  bool serviceReady = await checkLocationService(context);
  if (!serviceReady) {
    print("❌ GPS غير مفعّل");
    return false;
  }

  // 2. فحص الصلاحيات
  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  if (permission == LocationPermission.deniedForever) {
    // 3. فتح إعدادات التطبيق
    await showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text("صلاحية الموقع مرفوضة دائمًا"),
        content: Text("من فضلك فعّل صلاحية الموقع من إعدادات التطبيق."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              AppSettings.openAppSettings();
            },
            child: Text("فتح الإعدادات"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
            },
            child: Text("إلغاء"),
          ),
        ],
      ),
    );
    return false;
  }

  // 4. التحقق النهائي
  return permission == LocationPermission.always ||
         permission == LocationPermission.whileInUse;
}

}
