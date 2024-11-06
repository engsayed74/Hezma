import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hezma_app/core/utils/api_service.dart';
import 'package:hezma_app/features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void SetUpServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
