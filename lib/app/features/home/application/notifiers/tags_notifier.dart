import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/services/app_info.dart';

class TagNotifier extends StateNotifier<String> {
  TagNotifier(super.state, this.read);

  final Reader read;

  static final provider = StateNotifierProvider<TagNotifier, String>(
      (ref) => TagNotifier('All', ref.read));

  List<String> get tags => [
        'All',
        'Following',
        ...List<String>.from(read(AppInfo.provider)['tags'])
      ];

  void updateState(String tag) {
    state = tag;
  }
}
