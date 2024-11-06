import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hezma_app/features/home/data/models/sliders_model/slider_model.dart';
import 'package:hezma_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit(this.homeRepo) : super(SliderInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSliders() async {
    emit(SliderLoading());

    var result = await homeRepo.fetchSlider();
    result.fold(
      (failure) {
        emit(SliderFailure(failure
            .errorMesage)); // Ensure you access the correct error message
      },
      (sliders) {
        emit(SliderSuccess(sliders)); // sliders should be a List<SliderModel>
      },
    );
  }
}
