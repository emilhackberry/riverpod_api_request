import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_http_request/models/user.dart';

class ApiServices extends AsyncNotifier<void> {
  String endpoint = 'https://api.jsonbin.io/v3/b/64f047108d92e126ae652c1b';

  @override
  Future<List<UserModel>> build() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> userList = jsonResponse['record']['data'];
      return userList.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  // Future<List<UserModel>> getUsers() async {
  //   Response response = await get(Uri.parse(endpoint));
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> jsonResponse = json.decode(response.body);
  //     List<dynamic> userList = jsonResponse['record']['data'];
  //     return userList.map((e) => UserModel.fromJson(e)).toList();
  //   } else {
  //     throw Exception(response.reasonPhrase);
  //   }
  // }
}

final userProvider = Provider<ApiServices>((ref) => ApiServices());

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).build();
});
