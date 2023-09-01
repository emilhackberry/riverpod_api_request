import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_http_request/models/user.dart';
import 'package:riverpod_http_request/services/auth_service.dart';

part 'api_controller.g.dart';

@riverpod
class ApiController extends _$ApiController {
  String endpoint = 'https://api.jsonbin.io/v3/b/64f047108d92e126ae652c1b';

  @override
  Future<List<UserModel>> build({
    required AuthService authService,
  }) async {
    authService.controller.listen(authService.onAuthStateChange);
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> userList = jsonResponse['record']['data'];
      return userList.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
