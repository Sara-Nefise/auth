import 'package:freezed_annotation/freezed_annotation.dart';

import '../login/domain/user_domain.dart';

part 'auth_state.freezed.dart';

enum AuthStatus {
  initilizing,
  loading,
  authrized,
  unAuthrized,
  login,
  information,
  error,
  logout,
  updateAccount,
}

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    required AuthStatus status,
    String? message,
    AppUser? currentUser,
  }) = _AuthState;
}
