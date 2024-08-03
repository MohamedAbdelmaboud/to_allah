class UserModel {
  final String name;

  UserModel({
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
  UserModel copyWith({
    String? name,
  }) {
    return UserModel(
      name: name ?? this.name,
    );
  }

}
