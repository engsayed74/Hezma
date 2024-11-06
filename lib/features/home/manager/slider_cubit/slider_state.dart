part of 'slider_cubit.dart';

@immutable
sealed class SliderState {}

final class SliderInitial extends SliderState {}

final class SliderLoading extends SliderState {}

final class SliderFailure extends SliderState {
  final String errorMessage;

  SliderFailure(this.errorMessage);
}

final class SliderSuccess extends SliderState {
  final List<SliderModel> slider;

  SliderSuccess(this.slider);
}
