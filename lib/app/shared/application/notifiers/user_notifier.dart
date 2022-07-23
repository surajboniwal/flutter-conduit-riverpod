import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/auth/data/models/user.dart';
import '../events/user_event.dart';
import '../states/user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier(super.state);

  static final provider = StateNotifierProvider<UserNotifier, UserState>(
      (ref) => UserNotifier(UserState.none()));

  void call(UserEvent event) {
    event.when(set: _set);
  }

  void _set(User user) {
    state = UserState.data(user);
  }
}
