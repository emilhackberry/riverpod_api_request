import 'package:riverpod_http_request/services/services.dart';

class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'] ?? 'First name',
      lastName: json['lastName'] ?? 'Last name',
      avatar: json['avatar'] ?? '',
    );
  }
}
