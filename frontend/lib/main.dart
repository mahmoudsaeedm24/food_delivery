import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/components/cubit/user_cubit.dart';
import 'package:frontend/core/dependency_injection/di.dart' as di;
import 'package:frontend/core/observers/cubit_observer.dart';
import 'package:frontend/core/services/network_checker.dart';
import 'package:frontend/core/utils/extensions/context_extension.dart';
import 'package:frontend/core/utils/hive_utils/hive_prepare.dart';
import 'package:frontend/core/utils/router.dart';
import 'package:frontend/features/cart/presentation/controllers/cubit/cart_models_cubit.dart';
import 'package:frontend/features/home/presentation/controllers/get_categories/get_categories_cubit.dart';
import 'package:frontend/features/home/presentation/controllers/get_products/get_all_products_cubit.dart';
import 'package:get_it/get_it.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HivePrepare.initHive();
  di.init();
  // await SecureDataBase.removeToken();
  Bloc.observer = CubitObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Future check(context) async {
  //   final per = await Permissions.checkLocationPermission(context);
  //   // log("per $per");
  // }
  

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartModelsCubit>(
          create: (context) => di.getIt<CartModelsCubit>(),
        ),
        BlocProvider<GetProductsCubit>(
          create: (context) => di.getIt<GetProductsCubit>(),
        ),
        BlocProvider<GetCategoriesCubit>(
          create: (context) => di.getIt<GetCategoriesCubit>(),
        ),
        BlocProvider<UserCubit>(create: (context) => di.getIt<UserCubit>()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            theme: ThemeData.dark(),
            onGenerateRoute: onGenerateRoute,
            // home: Scaffold(
            //   appBar: AppBar(),
            //   body: TestScrolling(),
            // ),
            navigatorObservers: [routeObserver],
          );
        },
      ),
    );
  }
}
