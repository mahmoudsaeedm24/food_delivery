import 'package:frontend/core/services/network_checker.dart';

class RepoDependencies<OnlineDataBase, LocalDataBase> {
  final OnlineDataBase online;
  final LocalDataBase local;
  final NetworkChecker networkChecker;

  RepoDependencies({
    required this.online,
    required this.local,
    required this.networkChecker,
  });
}
