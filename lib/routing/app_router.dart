import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_http_request/widgets/homePage.dart';
import 'package:riverpod_http_request/widgets/login_and_signup_page.dart';

enum AppRoute {
  feed,
  loginPage,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.loginPage.name,
        builder: (context, state) => const LoginSignUpPage(),
      ),
      GoRoute(
        path: '/feed',
        name: AppRoute.feed.name,
        builder: (context, state) => const HomePageScreen(),
      )
    ],
    errorBuilder: (context, state) => const Text("Not found"),
  );
});
