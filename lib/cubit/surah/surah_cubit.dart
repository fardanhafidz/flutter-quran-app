import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ahlul_quran_app/data/model/surah_model.dart';
import 'package:flutter_ahlul_quran_app/data/service_api.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit(this.apiService) : super(SurahInitial());

  final ApiService apiService;

  void getAllSurah() async {
    emit(SurahLoading());
    final result = await apiService.getAllSurah();
    result.fold((l) => emit(SurahError(message: l)),
        (r) => emit(SurahLoaded(listSurah: r)));
  }
}
