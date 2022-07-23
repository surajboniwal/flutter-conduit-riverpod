import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../features/auth/data/models/user.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  factory UserState.none() = _None;
  factory UserState.data(final User user) = _Data;
}
