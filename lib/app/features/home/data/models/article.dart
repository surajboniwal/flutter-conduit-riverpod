import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'author.dart';

class Article {
  String slug;
  String title;
  String description;
  String body;
  List<String> tagList;
  DateTime createdAt;
  DateTime updatedAt;
  bool favorited;
  int favoritesCount;
  Author author;

  Article({
    required this.slug,
    required this.title,
    required this.description,
    required this.body,
    required this.tagList,
    required this.createdAt,
    required this.updatedAt,
    required this.favorited,
    required this.favoritesCount,
    required this.author,
  });

  Article copyWith({
    String? slug,
    String? title,
    String? description,
    String? body,
    List<String>? tagList,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? favorited,
    int? favoritesCount,
    Author? author,
  }) {
    return Article(
      slug: slug ?? this.slug,
      title: title ?? this.title,
      description: description ?? this.description,
      body: body ?? this.body,
      tagList: tagList ?? this.tagList,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      favorited: favorited ?? this.favorited,
      favoritesCount: favoritesCount ?? this.favoritesCount,
      author: author ?? this.author,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'slug': slug,
      'title': title,
      'description': description,
      'body': body,
      'tagList': tagList,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'favorited': favorited,
      'favoritesCount': favoritesCount,
      'author': author.toMap(),
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      slug: map['slug'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      body: map['body'] as String,
      tagList: List<String>.from((map['tagList'])),
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      favorited: map['favorited'] as bool,
      favoritesCount: map['favoritesCount'] as int,
      author: Author.fromMap(map['author'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Article(slug: $slug, title: $title, description: $description, body: $body, tagList: $tagList, createdAt: $createdAt, updatedAt: $updatedAt, favorited: $favorited, favoritesCount: $favoritesCount, author: $author)';
  }

  @override
  bool operator ==(covariant Article other) {
    if (identical(this, other)) return true;

    return other.slug == slug &&
        other.title == title &&
        other.description == description &&
        other.body == body &&
        listEquals(other.tagList, tagList) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.favorited == favorited &&
        other.favoritesCount == favoritesCount &&
        other.author == author;
  }

  @override
  int get hashCode {
    return slug.hashCode ^
        title.hashCode ^
        description.hashCode ^
        body.hashCode ^
        tagList.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        favorited.hashCode ^
        favoritesCount.hashCode ^
        author.hashCode;
  }
}
