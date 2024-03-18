import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  String userName;
  String password;
  String phone;
  String email;

  Users({
    required this.userName,
    required this.password,
    required this.phone,
    required this.email,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        userName: json["user_name"],
        password: json["password"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "user_name": userName,
        "password": password,
        "phone": phone,
        "email": email,
      };
}
