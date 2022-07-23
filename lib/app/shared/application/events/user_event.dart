import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../features/home/data/models/user.dart';

part 'user_event.freezed.dart';

@freezed
class UserEvent with _$UserEvent {
  factory UserEvent.set(User user) = _Set;
}
