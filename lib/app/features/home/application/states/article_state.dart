import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/article.dart';

part 'article_state.freezed.dart';

@freezed
class ArticleState with _$ArticleState {
  factory ArticleState.loading() = _Loading;
  factory ArticleState.error(String error) = _Error;
  factory ArticleState.data(List<Article> data) = _Data;
}
