import '../../../../core/network_manager.dart';
import '../models/article.dart';

class ArticleRepository {
  final NetworkManager networkManager;

  ArticleRepository(this.networkManager);

  Future<ApiResponse<List<Article>, Map<String, dynamic>>>
      fetchArticles() async {
    final response =
        await networkManager.request(RequestMethod.get, '/articles');

    if (response.status.isError()) {
      return ApiResponse.error(response.message.response?.data ?? {});
    }

    return ApiResponse.completed((response.data.data['articles'] as List)
        .map((e) => Article.fromMap(e))
        .toList());
  }
}
