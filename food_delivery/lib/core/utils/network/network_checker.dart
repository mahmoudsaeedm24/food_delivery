import 'package:connectivity_plus/connectivity_plus.dart';



class NetworkChecker {
  Future<bool> isConnected() async {
  Connectivity connectivity = Connectivity();
  final List<ConnectivityResult> connection = await connectivity
      .checkConnectivity();
  return !connection.contains(ConnectivityResult.none);
}
}
