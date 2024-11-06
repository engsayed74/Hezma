import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hezma_app/core/errors/failures.dart';
import 'package:hezma_app/core/utils/api_service.dart';
import 'package:hezma_app/features/home/data/models/category_model/category_model.dart';
import 'package:hezma_app/features/home/data/models/product_model/product_model.dart';
import 'package:hezma_app/features/home/data/models/register_model/register_model.dart';
import 'package:hezma_app/features/home/data/models/sliders_model/datum.dart';
import 'package:hezma_app/features/home/data/models/sliders_model/slider_model.dart';
import 'package:hezma_app/features/home/data/models/terms_model/terms_model.dart';
import 'package:hezma_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<ProductModel>>> fetchProducts() async {
    try {
      var data = await apiService.get(endPoint: 'products');
      List<ProductModel> products = [];
      for (var item in data['data']) {
        try {
          products.add(ProductModel.fromJson(item));
        } catch (e) {
          products.add(ProductModel.fromJson(item));
        }
      }

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<TermsModel>>> fetchTerms() async {
    try {
      var data = await apiService.get(endPoint: 'terms');
      List<TermsModel> terms = [];
      for (var item in data['data']) {
        try {
          terms.add(TermsModel.fromJson(item));
        } catch (e) {
          terms.add(TermsModel.fromJson(item));
        }
      }

      return right(terms);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<SliderModel>>> fetchSlider() async {
    try {
      var response = await apiService.get(endPoint: 'sliders');

      // Check if the response is valid
      if (response['status']) {
        List<SliderModel> sliders = [];
        for (var item in response['data']) {
          sliders.add(SliderModel.fromJson(item));
        }
        return right(sliders);
      } else {
        return left(ServerFailure(response['message']));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> fetchCategories() async {
    try {
      var data = await apiService.get(endPoint: 'categories');
      List<CategoryModel> categories = [];
      for (var item in data['data']) {
        try {
          categories.add(CategoryModel.fromJson(item));
        } catch (e) {
          categories.add(CategoryModel.fromJson(item));
        }
      }

      return right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
