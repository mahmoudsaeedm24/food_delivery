import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/home/data/repo/get_categories_repo.dart';
import '../../../data/model/category_model.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit(this._repo) : super(GetCategoriesInitial());
  final GetCategoriesRepo _repo;

  Future<void> getAllCategories() async {
    emit(GetCategoriesLoading());
    try {
      final either = await _repo.getAllCategories();
      // log("$either");
      either.fold((l) => emit(GetCategoriesFailed()), (categories) {
        emit(GetCategoriesSuccess(categories: categories));
      });
    } catch (e) {
      // log("Error $e");
      emit(GetCategoriesFailed());
    }
  }
}
