class UserAuth {
  final String name;
  final String username;
  final String password;

  UserAuth({
    required this.name,
    required this.username,
    required this.password,
  });

  factory UserAuth.fromJson(Map<String, dynamic> json) {
    return UserAuth(
      name: json['name'],
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'password': password,
    };
  }
}
