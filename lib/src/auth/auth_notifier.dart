import 'package:auth_login/src/auth/auth_state.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../login/data/api_user_repository.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final appUserService = ref.watch(apiUserAccountRepositoryProvider);

  return AuthStateNotifier(
    appUserService: appUserService,
  );
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  final appUserService;

  AuthStateNotifier({
    required this.appUserService,
  }) : super(AuthState(status: AuthStatus.initilizing)) {
    //here we should add listner
  }
  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      BotToast.showLoading();

      if (email.isEmpty || password.isEmpty) {
        BotToast.closeAllLoading();
        BotToast.showText(
          text: "يرجى التأكد من المعلومات المدخلة",
          contentColor: Colors.red,
        );
        state = AuthState(status: AuthStatus.unAuthrized);
      } else {
        final loginResponse =
            await appUserService.signIn(email: email, password: password);
        if (loginResponse) {
          BotToast.showText(text: "login successfully.");
          state = AuthState(status: AuthStatus.authrized);
        } else {
          BotToast.showText(text: "Wrong email or password");
          state = AuthState(status: AuthStatus.unAuthrized);
        }
      }
    } catch (error) {
      BotToast.showText(text: "An error occurred");
      state = AuthState(status: AuthStatus.unAuthrized);
    } finally {
      BotToast.closeAllLoading();
    }
  }
}
