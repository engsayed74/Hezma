import 'package:bloc/bloc.dart';
import 'package:hezma_app/core/errors/failures.dart';
import 'package:hezma_app/features/home/data/models/product_model/product_model.dart';
import 'package:hezma_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.homeRepo) : super(ProductInitial());

  final HomeRepo homeRepo;

  Future<void> fetchProduct() async {
    emit(ProductLoading());

    var result = await homeRepo.fetchProducts();
    result.fold((Failure) {
      emit(ProductFailure(Failure.errorMesage));
    }, (products) {
      emit(ProductSuccess(products));
    });
  }
}
