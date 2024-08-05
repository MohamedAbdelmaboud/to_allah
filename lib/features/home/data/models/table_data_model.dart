class TableDataModel {
  final int dayIndex;
  final DateTime dayDate;
  bool morningAzkar;
  int prayInMasjid;
  int takberElehram;
  int sunnah;
  bool prayInNabi;
  bool quranVerse;
  bool eveningAzkar;
  bool midnightQiam;

  TableDataModel({
    required this.dayIndex,
    required this.dayDate,
    required this.morningAzkar,
    required this.prayInMasjid,
    required this.takberElehram,
    required this.sunnah,
    required this.prayInNabi,
    required this.quranVerse,
    required this.eveningAzkar,
    required this.midnightQiam,
  });

  factory TableDataModel.initial({
    required int dayIndex,
    required DateTime dayDate,
  }) =>
      TableDataModel(
        dayIndex: dayIndex,
        dayDate: dayDate,
        morningAzkar: false,
        prayInMasjid: 0,
        takberElehram: 0,
        sunnah: 0,
        prayInNabi: false,
        quranVerse: false,
        eveningAzkar: false,
        midnightQiam: false,
      );

  factory TableDataModel.fromJson(Map<String, dynamic> json) => TableDataModel(
        dayIndex: json["dayIndex"],
        dayDate: DateTime.parse(json["dayDate"]),
        morningAzkar: json["morningAzkar"],
        prayInMasjid: json["prayInMasjid"],
        takberElehram: json["takberElehram"],
        sunnah: json["sunnah"],
        prayInNabi: json["prayInNabi"],
        quranVerse: json["quranVerse"],
        eveningAzkar: json["eveningAzkar"],
        midnightQiam: json["midnightQiam"],
      );

  Map<String, dynamic> toJson() => {
        "dayIndex": dayIndex,
        "dayDate": dayDate.toIso8601String(),
        "morningAzkar": morningAzkar,
        "prayInMasjid": prayInMasjid,
        "takberElehram": takberElehram,
        "sunnah": sunnah,
        "prayInNabi": prayInNabi,
        "quranVerse": quranVerse,
        "eveningAzkar": eveningAzkar,
        "midnightQiam": midnightQiam,
      };

  TableDataModel copyWith({
    int? dayIndex,
    DateTime? dayDate,
    bool? morningAzkar,
    int? prayInMasjid,
    int? takberElehram,
    int? sunnah,
    bool? prayInNabi,
    bool? quranVerse,
    bool? eveningAzkar,
    bool? midnightQiam,
  }) {
    return TableDataModel(
      dayIndex: dayIndex ?? this.dayIndex,
      dayDate: dayDate ?? this.dayDate,
      morningAzkar: morningAzkar ?? this.morningAzkar,
      prayInMasjid: prayInMasjid ?? this.prayInMasjid,
      takberElehram: takberElehram ?? this.takberElehram,
      sunnah: sunnah ?? this.sunnah,
      prayInNabi: prayInNabi ?? this.prayInNabi,
      quranVerse: quranVerse ?? this.quranVerse,
      eveningAzkar: eveningAzkar ?? this.eveningAzkar,
      midnightQiam: midnightQiam ?? this.midnightQiam,
    );
  }

  void toggleMorningAzkar() => morningAzkar = !morningAzkar;

  void incrementPrayInMasjid() {
    if (prayInMasjid == 5) {
      prayInMasjid = 0;
    } else {
      prayInMasjid++;
    }
  }

  void incrementTakberElehram() {
    if (takberElehram == 5) {
      takberElehram = 0;
    } else {
      takberElehram++;
    }
  }

  void incrementSunnah() {
    if (sunnah == 12) {
      sunnah = 0;
    } else {
      sunnah += 2;
    }
  }

  void togglePrayInNabi() => prayInNabi = !prayInNabi;

  void toggleQuranVerse() => quranVerse = !quranVerse;

  void toggleEveningAzkar() => eveningAzkar = !eveningAzkar;

  void toggleMidnightQiam() => midnightQiam = !midnightQiam;
}
