import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network_manager.dart';
import '../data/repository/article_repository.dart';
import 'states/article_state.dart';

class ArticleNotifier extends StateNotifier<ArticleState> {
  ArticleNotifier(super.state, this.articleRepository) {
    getArticles();
  }

  final ArticleRepository articleRepository;

  static final provide =
      StateNotifierProvider<ArticleNotifier, ArticleState>((ref) {
    final networkManager = NetworkManager();
    final articleRepository = ArticleRepository(networkManager);
    return ArticleNotifier(ArticleState.loading(), articleRepository);
  });

  Future<void> getArticles() async {
    final articleResponse = await articleRepository.fetchArticles();

    state = ArticleState.data(articleResponse.data);
  }
}
