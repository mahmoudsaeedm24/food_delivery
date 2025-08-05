
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/components/cubit/user_cubit.dart';
import 'package:food_delivery/core/dependency_injection/di.dart' as di;
import 'package:food_delivery/core/observers/cubit_observer.dart';
import 'package:food_delivery/core/observers/screen_observer.dart';
import 'package:food_delivery/core/utils/hive_utils/hive_prepare.dart';
import 'package:food_delivery/core/utils/router.dart';
import 'package:food_delivery/features/cart/presentation/controllers/cubit/cart_models_cubit.dart';
import 'package:food_delivery/features/home/presentation/controllers/get_categories/get_categories_cubit.dart';
import 'package:food_delivery/features/home/presentation/controllers/get_products/get_all_products_cubit.dart';

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
            // theme: ThemeData.dark(),
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
