part of 'surah_cubit.dart';

abstract class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object> get props => [];
}

class SurahInitial extends SurahState {}

class SurahLoading extends SurahState {}

class SurahLoaded extends SurahState {
  final List<SurahModel> listSurah;

  const SurahLoaded({required this.listSurah});

  @override
  List<Object> get props => [listSurah];
}

class SurahError extends SurahState {
  final String message;
  const SurahError({required this.message});

  @override
  List<Object> get props => [message];
}
