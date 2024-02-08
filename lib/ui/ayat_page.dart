import 'package:flutter/material.dart';
import 'package:flutter_ahlul_quran_app/contants.dart';
import 'package:flutter_ahlul_quran_app/cubit/ayat/ayat_cubit.dart';
import 'package:flutter_ahlul_quran_app/data/model/surah_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AyatPage extends StatefulWidget {
  const AyatPage({
    Key? key,
    required this.surah,
  }) : super(key: key);

  final SurahModel surah;

  @override
  State<AyatPage> createState() => _AyatPageState();
}

class _AyatPageState extends State<AyatPage> {
  @override
  void initState() {
    context.read<AyatCubit>().getDetailSurah(widget.surah.nomor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Surah ${widget.surah.namaLatin}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: BlocBuilder<AyatCubit, AyatState>(
        builder: (context, state) {
          if (state is AyatLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AyatLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final ayat = state.detail.ayat[index];

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        child: Text(
                          '${ayat.nomor}',
                          style: const TextStyle(color: AppColors.white),
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          ayat.ar,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontFamily: 'Sche',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Text(ayat.idn),
                    ),
                  ),
                );
              },
              itemCount: state.detail.ayat.length,
            );
          }

          if (state is AyatError) {
            return Center(
              child: Text(state.message),
            );
          }

          return const Center(
            child: Text('No Data'),
          );
        },
      ),
    );
  }
}
