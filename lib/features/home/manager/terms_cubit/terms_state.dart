part of 'terms_cubit.dart';

@immutable
sealed class TermsState {}

final class TermsInitial extends TermsState {}

final class TermsLoading extends TermsState {}

final class TermsFailure extends TermsState {
  final String errorMesage;

  TermsFailure(this.errorMesage);
}

final class TermsSuccess extends TermsState {
  final List<TermsModel> terms;

  TermsSuccess(this.terms);
}
