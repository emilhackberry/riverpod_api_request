import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_http_request/models/user.dart';
import 'package:riverpod_http_request/services/services.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});
