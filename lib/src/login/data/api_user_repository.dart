import 'dart:convert';

import 'package:auth_login/src/login/data/user_repository.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

// part 'api_user_repository.g.dart';

// @riverpod
// APIUserRepository apiUserRepository(ApiUserRepositoryRef ref) {
//   return APIUserRepository();
// }
final apiUserAccountRepositoryProvider =
    Provider<ApiUserRepository>(
        (ref) => ApiUserRepository());


class ApiUserRepository implements UserRepository {
  @override
  Future<bool> signIn({required String email, required String password}) async {
    print(email);
    print(password);
    http.MultipartRequest request = http.MultipartRequest('POST',
        Uri.parse('https://minaini.com:2053/r/token/'));
    request.fields['email'] = email;
    request.fields['password'] = password;

    var response = await request.send();
    print('response.statusCode ${response.statusCode}');
    if (response.statusCode == 200) {
      final user = await utf8.decodeStream(response.stream);
      final responseBody = json.decode(user);
      print(responseBody);
      BotToast.closeAllLoading();
      BotToast.showText(text: "login successfully.");
      return true;
    } else if (response.statusCode == 401) {
      BotToast.closeAllLoading();
      BotToast.showText(text: "Wrong email or password");
      return false;
    } else {
      BotToast.closeAllLoading();
      BotToast.showText(text: "Wrong email or password");
      return false;
    }
  }
}
