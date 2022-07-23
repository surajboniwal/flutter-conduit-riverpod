import 'package:conduit/app/features/home/application/notifiers/tags_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network_manager.dart';
import '../../data/repository/article_repository.dart';
import '../states/article_state.dart';

class ArticleNotifier extends StateNotifier<ArticleState> {
  ArticleNotifier(super.state, this.articleRepository, this.ref) {
    ref.listen(TagNotifier.provider, (previous, next) {
      // log(next.toString());
      getArticles(next.toString());
    });
    getArticles('All');
  }

  final ArticleRepository articleRepository;
  final Ref ref;

  static final provide =
      StateNotifierProvider<ArticleNotifier, ArticleState>((ref) {
    final networkManager = NetworkManager();
    final articleRepository = ArticleRepository(networkManager);
    return ArticleNotifier(ArticleState.loading(), articleRepository, ref);
  });

  Future<void> getArticles(String tag) async {
    state = ArticleState.loading();
    final articleResponse = await articleRepository.fetchArticles(tag);

    if (articleResponse.status.isError()) {
      state = ArticleState.error("Unable to load articles");
      return;
    }

    if (articleResponse.data.isEmpty) {
      state = ArticleState.empty(tag);
      return;
    }

    state = ArticleState.data(articleResponse.data);
  }
}
