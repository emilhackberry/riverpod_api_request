import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_http_request/app.dart';
import 'package:riverpod_http_request/firebase_options.dart';
import 'package:riverpod_http_request/widgets/homePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:riverpod_http_request/widgets/login_and_signup_page.dart';
import 'package:shimmer/main.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      //child: HomePageScreen(),
      //child: MaterialApp(home: LoginSignUpPage()),
      child: MyAppTrue(),
    ),
  );
}
