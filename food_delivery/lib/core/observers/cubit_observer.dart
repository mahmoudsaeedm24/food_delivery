import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class CubitObserver extends BlocObserver {
  Logger logger = Logger();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log(
      "Cubit change from [ ${change.currentState.runtimeType} => ${change.nextState.runtimeType} ]",
    );
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log("cubit ${bloc.state.runtimeType} closed");
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log("Cubit ${bloc.state.runtimeType} is created");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log(
      "cubit ${bloc.state.runtimeType} has error [ ${error.runtimeType} ] \nStacktrace: ${stackTrace.runtimeType}",
    );
  }
}
