import 'dart:convert';

class SurahModel {
    final int nomor;
    final String nama;
    final String namaLatin;
    final int jumlahAyat;
    final TempatTurun tempatTurun;
    final String arti;
    final String deskripsi;
    final String audio;

    SurahModel({
        required this.nomor,
        required this.nama,
        required this.namaLatin,
        required this.jumlahAyat,
        required this.tempatTurun,
        required this.arti,
        required this.deskripsi,
        required this.audio,
    });

    factory SurahModel.fromRawJson(String str) => SurahModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["nama_latin"],
        jumlahAyat: json["jumlah_ayat"],
        tempatTurun: tempatTurunValues.map[json["tempat_turun"]]!,
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audio: json["audio"],
    );

    Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurunValues.reverse[tempatTurun],
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
    };
}

enum TempatTurun {
    MADINAH,
    MEKAH
}

final tempatTurunValues = EnumValues({
    "madinah": TempatTurun.MADINAH,
    "mekah": TempatTurun.MEKAH
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
