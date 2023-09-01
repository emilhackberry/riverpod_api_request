import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

class AuthService {
  AuthService() {
    controller = FirebaseAuth.instance.authStateChanges().asBroadcastStream();
  }
  late final Stream<User?> controller;

  dynamic onAuthStateChange(User? user) {
    String returnedValue = "";
    {
      if (user == null) {
        returnedValue = "User is Logged out 😞!";
      } else {
        returnedValue = "User is Logged in 😀!";
      }
    }
    return returnedValue;
  }
}

@riverpod
AuthService authService(AuthServiceRef ref) {
  return AuthService();
}
