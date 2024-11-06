import 'package:bloc/bloc.dart';
import 'package:hezma_app/features/home/data/models/category_model/category_model.dart';
import 'package:hezma_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.homeRepo) : super(CategoryInitial());

  final HomeRepo homeRepo;

  Future<void> fetchCategory() async {
    emit(CategoryLoading());

    var result = await homeRepo.fetchCategories();
    result.fold((Failure) {
      emit(CategoryFailure(Failure.errorMesage));
    }, (categories) {
      emit(CategorySuccess(categories));
    });
  }
}
