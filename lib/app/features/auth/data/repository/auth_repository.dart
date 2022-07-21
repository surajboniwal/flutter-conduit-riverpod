import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network_manager.dart';

class AuthRepository {
  final NetworkManager networkManager;

  AuthRepository(this.networkManager);

  static final provider = Provider((ref) {
    final networkManager = ref.read(NetworkManager.provider);
    return AuthRepository(networkManager);
  });

  Future<ApiResponse<Map<String, dynamic>, Map<String, dynamic>>> register(
      Map<String, dynamic> data) async {
    final response = await networkManager.request(
      RequestMethod.post,
      '/users',
      data: data,
    );

    if (response.status.isError()) {
      return ApiResponse.error(response.message.response?.data['errors'] ?? {});
    }

    return ApiResponse.completed(response.data.data);
  }

  Future<ApiResponse<Map<String, dynamic>, Map<String, dynamic>>> login(
      Map<String, dynamic> data) async {
    final response = await networkManager.request(
      RequestMethod.post,
      '/users/login',
      data: data,
    );

    if (response.status.isError()) {
      return ApiResponse.error(response.message.response?.data['errors'] ?? {});
    }

    return ApiResponse.completed(response.data.data);
  }
}
