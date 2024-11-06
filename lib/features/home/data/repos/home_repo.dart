import 'package:dartz/dartz.dart';
import 'package:hezma_app/core/errors/failures.dart';
import 'package:hezma_app/features/home/data/models/category_model/category_model.dart';
import 'package:hezma_app/features/home/data/models/product_model/product_model.dart';
import 'package:hezma_app/features/home/data/models/register_model/register_model.dart';
import 'package:hezma_app/features/home/data/models/sliders_model/slider_model.dart';
import 'package:hezma_app/features/home/data/models/terms_model/terms_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> fetchProducts();

  Future<Either<Failure, List<TermsModel>>> fetchTerms();
  Future<Either<Failure, List<SliderModel>>> fetchSlider();
    Future<Either<Failure, List<CategoryModel>>> fetchCategories();


}
