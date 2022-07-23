import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network_manager.dart';

class AppInfo extends StateNotifier<Map<String, dynamic>> {
  AppInfo(super.state, this.networkManager);

  final NetworkManager networkManager;

  static final provider =
      StateNotifierProvider<AppInfo, Map<String, dynamic>>((ref) {
    final networkManager = ref.read(NetworkManager.provider);

    return AppInfo({}, networkManager);
  });

  Future<void> init() async {
    final data = await networkManager.request(
      RequestMethod.get,
      '/tags',
    );

    if (data.status.isSuccess()) {
      state = data.data.data;
    }
  }
}
