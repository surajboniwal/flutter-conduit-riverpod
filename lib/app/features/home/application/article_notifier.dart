import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network_manager.dart';
import '../data/repository/article_repository.dart';

class ArticleNotifier extends StateNotifier<String?> {
  ArticleNotifier(super.state, this.articleRepository) {
    getArticles();
  }

  final ArticleRepository articleRepository;

  static final provide = StateNotifierProvider<ArticleNotifier, String?>((ref) {
    final networkManager = NetworkManager();
    final articleRepository = ArticleRepository(networkManager);
    return ArticleNotifier(null, articleRepository);
  });

  Future<void> getArticles() async {
    final articleResponse = await articleRepository.fetchArticles();
  }
}
