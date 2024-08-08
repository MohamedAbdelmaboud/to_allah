class DayModel {
  final int index;
  final DateTime date;

  DayModel({
    required this.index,
    required this.date,
  });

  factory DayModel.fromJson(Map<String, dynamic> json) => DayModel(
        index: json["index"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "date": date.toIso8601String(),
      };
}
