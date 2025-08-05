import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/home/data/model/category_model.dart';
import 'package:food_delivery/features/home/presentation/controllers/get_categories/get_categories_cubit.dart';
import 'package:food_delivery/features/home/presentation/views/widgets/category_part/categories_part.dart';
import 'package:food_delivery/features/home/presentation/views/widgets/product_part/prdoucts_list.dart';
import 'package:food_delivery/features/home/presentation/views/widgets/top_part/home_top_widget.dart';
import 'package:food_delivery/main.dart';

import '../../controllers/get_products/get_all_products_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  @override
  void initState() {
    super.initState();
    context.read<GetCategoriesCubit>().getAllCategories();
    context.read<GetProductsCubit>().getProductsByCategoryId(
      categoryId: CategoryModel.defaultCategory().id!,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  //? hint: this method execute each time you come back to this page
  @override
  void didPopNext() {
    log(
      "طالما رجعت الصفحة تاني ف هرجع احمل الداتا تاني #didPopNext #homeScreen",
    );
    context.read<GetCategoriesCubit>().getAllCategories();
    //TODO دي هتجيب الداتا كلها سواء كنت واقف ع الديفولت او اي كاتجوري تاني
    // TODO create a cubit to store the current category in temp state
    // context.read<GetProductsCubit>().getProductsByCategoryId(
    //   categoryId: CategoryModel.defaultCategory().id!,
    // );
    // Called when coming back to this screen
    //* it responsible for refreshing the data stored in cart screen
    // context.read<GetProductFromCartCubit>().refresh(); // or fetch again
    // or context.read<GetProductsCubit>().refresh();

    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: IconButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) {
        //           return PaymentScreen();
        //         },
        //       ),
        //     );
        //   },
        //   icon: Icon(Icons.shopping_cart),
        // ),
        body: Container(
          // color: MyColors.primaryColor,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            child: Column(
              children: [HomeTopWidget(), CategoriesPart(), PrdouctsList()],
            ),
          ),
        ),
      ),
    );
  }
}
