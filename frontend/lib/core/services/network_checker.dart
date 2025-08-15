import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class NetworkChecker {
  final Connectivity _connectivity;
  final Dio _dio;

  NetworkChecker({
    required Connectivity connectivity,
    required Dio dio,
  })  : _connectivity = connectivity,
        _dio = dio;

  /// Snapshot check (تنفذها وقت الحاجة بس)
  Future<bool> isConnected() async {
    final List<ConnectivityResult> connection =
        await _connectivity.checkConnectivity();

    // Check if there is any network interface active
    if (connection.contains(ConnectivityResult.none)) {
      return false;
    }

    // Optional: Double check by pinging Google (or any reliable host)
    try {
      final res = await _dio.get(
        'https://www.google.com',
      );
      return res.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  /// Real-time updates stream (listen طول ما الاب مفتوح)
  Stream<bool> get connectionStream {
    return _connectivity.onConnectivityChanged.map(
      (List<ConnectivityResult> event) {
        return !event.contains(ConnectivityResult.none);
      },
    );
  }
}

