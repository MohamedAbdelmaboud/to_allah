import 'table_data_model.dart';

class UserDataModel {
  final String username;
  final List<TableDataModel> data;

  UserDataModel({
    required this.username,
    required this.data,
  });


  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    username: json["username"],
    data: List<TableDataModel>.from(json["data"].map((x) => TableDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
