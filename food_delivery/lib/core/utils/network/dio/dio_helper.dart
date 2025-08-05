import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_delivery/core/components/data/data_sources/secure_data_base/secure_data_base.dart';

class DioHelper {
  static final InterceptorsWrapper sendToken = InterceptorsWrapper(
    onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
          final String? token = await SecureDataBase.getToken();
          if (token != null) {
            log("token will send in `authorization` header : $token");
            options.headers = {"authorization": "Bearer $token"};
          }
            handler.next(options);
        },
  );
  // static final InterceptorsWrapper storeToken = InterceptorsWrapper(
  //   onResponse: (res, handler) async {
  //     if (res.statusCode == 200) {
  //       final tokenHeader = res.headers.value('authorization');

  //       if (tokenHeader != null && tokenHeader.startsWith('Bearer ')) {
  //         final token = tokenHeader.split(' ')[1];
  //         await SecureDataBase.storeToken(token);
  //         log('✅ Token saved: $token');
  //       }
  //     }
  //   },
  // );
}
