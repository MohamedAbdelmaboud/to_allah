class UserAuth {
  final String username;
  final String password;

  UserAuth({
    required this.username,
    required this.password,
  });

  factory UserAuth.fromJson(Map<String, dynamic> json) {
    return UserAuth(
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
