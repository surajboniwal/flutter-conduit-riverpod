import 'package:conduit/app/features/home/application/events/article_event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network_manager.dart';
import '../../data/models/article.dart';
import '../../data/repository/article_repository.dart';
import '../states/article_state.dart';
import 'tags_notifier.dart';

class ArticleNotifier extends StateNotifier<ArticleState> {
  ArticleNotifier(super.state, this.articleRepository, this.ref) {
    ref.listen(TagNotifier.provider, (previous, next) {
      // log(next.toString());
      _getArticles(next.toString());
    });
    _getArticles('All');
  }

  final ArticleRepository articleRepository;
  final Ref ref;

  void call(ArticleEvent event) {
    event.when(
      favourite: (article) => _toggleFavourite(article, true),
      unfavourite: (article) => _toggleFavourite(article, false),
    );
  }

  void _toggleFavourite(Article article, bool status) {
    // state.whenOrNull(
    //   data: (data) {
    //     data = data.where
    //   },
    // );
  }

  static final provide =
      StateNotifierProvider<ArticleNotifier, ArticleState>((ref) {
    final networkManager = NetworkManager();
    final articleRepository = ArticleRepository(networkManager);
    return ArticleNotifier(ArticleState.loading(), articleRepository, ref);
  });

  Future<void> _getArticles(String tag) async {
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
