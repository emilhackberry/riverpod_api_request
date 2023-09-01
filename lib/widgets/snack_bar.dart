import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_http_request/services/auth_service.dart';

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key});
  @override
  Widget build(BuildContext context) {
    AuthService auth = AuthService();
    return Center(
      child: IconButton(
        icon: const Icon(Icons.check),
        onPressed: () {
          final snackBar = SnackBar(
            content: Text("${auth.onAuthStateChange(FirebaseAuth.instance.currentUser)}"),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}
