import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/article.dart';

part 'article_event.freezed.dart';

@freezed
class ArticleEvent with _$ArticleEvent {
  factory ArticleEvent.favourite(Article article) = _Favourite;
  factory ArticleEvent.unfavourite(Article article) = _UnFavourite;
}
