import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma_app/core/utils/api_service.dart';
import 'package:hezma_app/core/utils/service_locator.dart';
import 'package:hezma_app/features/home/data/repos/home_repo_impl.dart';
import 'package:hezma_app/features/home/manager/category_cubit/category_cubit.dart';
import 'package:hezma_app/features/home/manager/product_cubit/product_cubit.dart';
import 'package:hezma_app/features/home/manager/slider_cubit/slider_cubit.dart';
import 'package:hezma_app/features/home/manager/terms_cubit/terms_cubit.dart';
import 'package:hezma_app/views/splash_view.dart';

void main() {
  SetUpServiceLocator();
  runApp(const HezmaApp());
}

class HezmaApp extends StatelessWidget {
  const HezmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductCubit(
              getIt.get<HomeRepoImpl>(),
            )..fetchProduct(),
          ),
          BlocProvider(
            create: (context) => CategoryCubit(
              getIt.get<HomeRepoImpl>(),
            )..fetchCategory(),
          ),
          BlocProvider(
            create: (context) =>
                TermsCubit(getIt.get<HomeRepoImpl>())..fetchTerms(),
          ),
          BlocProvider(
            create: (context) =>
                SliderCubit(getIt.get<HomeRepoImpl>())..fetchSliders(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
              appBarTheme: const AppBarTheme(backgroundColor: Colors.white)),
          debugShowCheckedModeBanner: false,
          home: const SplashView(),
        ));
  }
}
