import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../events/auth_event.dart';
import '../states/auth_state.dart';

export '../events/auth_event.dart';

class AuthController extends StateNotifier<AuthState> {
  AuthController(super.state);

  static final provider = StateNotifierProvider<AuthController, AuthState>(
    (ref) => AuthController(
      const AuthState.initial(),
    ),
  );

  void call(AuthEvent event) {
    event.when(
      login: _login,
      register: _register,
    );
  }

  void _login(email, password) {
    state = AuthState.error(email);
  }

  Future<void> _register(username, email, password) async {
    state = const AuthState.loading();
    await Future.delayed(const Duration(seconds: 3));
    state = AuthState.success(username);
  }
}
