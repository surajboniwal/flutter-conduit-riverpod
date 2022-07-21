import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/auth_repository.dart';
import '../events/auth_event.dart';
import '../states/auth_state.dart';

export '../events/auth_event.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthNotifier(
    super.state, {
    required this.authRepository,
  });

  static final provider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) {
      final authRepository = ref.read(AuthRepository.provider);
      return AuthNotifier(
        const AuthState.initial(),
        authRepository: authRepository,
      );
    },
  );

  void call(AuthEvent event) {
    event.when(
      login: _login,
      register: _register,
      initial: _initial,
    );
  }

  void _initial() {
    state = const AuthState.initial();
  }

  Future<void> _login(email, password) async {
    state = const AuthState.loading();

    final loginResponse = await authRepository.login({
      'user': {
        'email': email,
        'password': password,
      },
    });

    if (loginResponse.status.isError()) {
      state = AuthState.error(
        emailError: loginResponse.message["email"]?[0],
        passwordError: loginResponse.message["password"]?[0] ??
            loginResponse.message["email or password"]?[0],
      );
      return;
    }

    print(loginResponse.data);
    state = AuthState.success(email);
  }

  Future<void> _register(username, email, password) async {
    state = const AuthState.loading();
    final registerResponse = await authRepository.register({
      'user': {
        'username': username,
        'email': email,
        'password': password,
      },
    });

    if (registerResponse.status.isError()) {
      print(registerResponse.message);
      state = AuthState.error(
        emailError: registerResponse.message["email"]?[0],
        passwordError: registerResponse.message["password"]?[0],
        usernameError: registerResponse.message["username"]?[0],
      );
      return;
    }

    print(registerResponse.data);
    state = AuthState.success(username);
  }
}
