import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ahlul_quran_app/data/model/detail_surah.dart';
import 'package:flutter_ahlul_quran_app/data/service_api.dart';

part 'ayat_state.dart';

class AyatCubit extends Cubit<AyatState> {
  AyatCubit(
    this.apiService,
  ) : super(AyatInitial());

  final ApiService apiService;

  void getDetailSurah(int noSurah) async {
    emit(AyatLoading());
    final result = await apiService.getDetailSurah(noSurah);

    result.fold(
      (l) => emit(AyatError(message: l)),
      (r) => emit(AyatLoaded(detail: r)),
    );
  }
}
