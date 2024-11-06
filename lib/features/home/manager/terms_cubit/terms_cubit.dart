import 'package:bloc/bloc.dart';
import 'package:hezma_app/features/home/data/models/terms_model/terms_model.dart';
import 'package:hezma_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit(this.homeRepo) : super(TermsInitial());
  final HomeRepo homeRepo;

  Future<void> fetchTerms() async {
    emit(TermsLoading());

    var result = await homeRepo.fetchTerms();
    result.fold((Failure) {
      emit(TermsFailure(Failure.errorMesage));
    }, (terms) {
      emit(TermsSuccess(terms));
    });
  }
}
