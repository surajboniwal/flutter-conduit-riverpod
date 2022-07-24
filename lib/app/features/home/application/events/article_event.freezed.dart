// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'article_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArticleEvent {
  Article get article => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Article article) favourite,
    required TResult Function(Article article) unfavourite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Article article)? favourite,
    TResult Function(Article article)? unfavourite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Article article)? favourite,
    TResult Function(Article article)? unfavourite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Favourite value) favourite,
    required TResult Function(_UnFavourite value) unfavourite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Favourite value)? favourite,
    TResult Function(_UnFavourite value)? unfavourite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Favourite value)? favourite,
    TResult Function(_UnFavourite value)? unfavourite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleEventCopyWith<ArticleEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleEventCopyWith<$Res> {
  factory $ArticleEventCopyWith(
          ArticleEvent value, $Res Function(ArticleEvent) then) =
      _$ArticleEventCopyWithImpl<$Res>;
  $Res call({Article article});
}

/// @nodoc
class _$ArticleEventCopyWithImpl<$Res> implements $ArticleEventCopyWith<$Res> {
  _$ArticleEventCopyWithImpl(this._value, this._then);

  final ArticleEvent _value;
  // ignore: unused_field
  final $Res Function(ArticleEvent) _then;

  @override
  $Res call({
    Object? article = freezed,
  }) {
    return _then(_value.copyWith(
      article: article == freezed
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as Article,
    ));
  }
}

/// @nodoc
abstract class _$$_FavouriteCopyWith<$Res>
    implements $ArticleEventCopyWith<$Res> {
  factory _$$_FavouriteCopyWith(
          _$_Favourite value, $Res Function(_$_Favourite) then) =
      __$$_FavouriteCopyWithImpl<$Res>;
  @override
  $Res call({Article article});
}

/// @nodoc
class __$$_FavouriteCopyWithImpl<$Res> extends _$ArticleEventCopyWithImpl<$Res>
    implements _$$_FavouriteCopyWith<$Res> {
  __$$_FavouriteCopyWithImpl(
      _$_Favourite _value, $Res Function(_$_Favourite) _then)
      : super(_value, (v) => _then(v as _$_Favourite));

  @override
  _$_Favourite get _value => super._value as _$_Favourite;

  @override
  $Res call({
    Object? article = freezed,
  }) {
    return _then(_$_Favourite(
      article == freezed
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as Article,
    ));
  }
}

/// @nodoc

class _$_Favourite implements _Favourite {
  _$_Favourite(this.article);

  @override
  final Article article;

  @override
  String toString() {
    return 'ArticleEvent.favourite(article: $article)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Favourite &&
            const DeepCollectionEquality().equals(other.article, article));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(article));

  @JsonKey(ignore: true)
  @override
  _$$_FavouriteCopyWith<_$_Favourite> get copyWith =>
      __$$_FavouriteCopyWithImpl<_$_Favourite>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Article article) favourite,
    required TResult Function(Article article) unfavourite,
  }) {
    return favourite(article);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Article article)? favourite,
    TResult Function(Article article)? unfavourite,
  }) {
    return favourite?.call(article);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Article article)? favourite,
    TResult Function(Article article)? unfavourite,
    required TResult orElse(),
  }) {
    if (favourite != null) {
      return favourite(article);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Favourite value) favourite,
    required TResult Function(_UnFavourite value) unfavourite,
  }) {
    return favourite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Favourite value)? favourite,
    TResult Function(_UnFavourite value)? unfavourite,
  }) {
    return favourite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Favourite value)? favourite,
    TResult Function(_UnFavourite value)? unfavourite,
    required TResult orElse(),
  }) {
    if (favourite != null) {
      return favourite(this);
    }
    return orElse();
  }
}

abstract class _Favourite implements ArticleEvent {
  factory _Favourite(final Article article) = _$_Favourite;

  @override
  Article get article;
  @override
  @JsonKey(ignore: true)
  _$$_FavouriteCopyWith<_$_Favourite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UnFavouriteCopyWith<$Res>
    implements $ArticleEventCopyWith<$Res> {
  factory _$$_UnFavouriteCopyWith(
          _$_UnFavourite value, $Res Function(_$_UnFavourite) then) =
      __$$_UnFavouriteCopyWithImpl<$Res>;
  @override
  $Res call({Article article});
}

/// @nodoc
class __$$_UnFavouriteCopyWithImpl<$Res>
    extends _$ArticleEventCopyWithImpl<$Res>
    implements _$$_UnFavouriteCopyWith<$Res> {
  __$$_UnFavouriteCopyWithImpl(
      _$_UnFavourite _value, $Res Function(_$_UnFavourite) _then)
      : super(_value, (v) => _then(v as _$_UnFavourite));

  @override
  _$_UnFavourite get _value => super._value as _$_UnFavourite;

  @override
  $Res call({
    Object? article = freezed,
  }) {
    return _then(_$_UnFavourite(
      article == freezed
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as Article,
    ));
  }
}

/// @nodoc

class _$_UnFavourite implements _UnFavourite {
  _$_UnFavourite(this.article);

  @override
  final Article article;

  @override
  String toString() {
    return 'ArticleEvent.unfavourite(article: $article)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnFavourite &&
            const DeepCollectionEquality().equals(other.article, article));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(article));

  @JsonKey(ignore: true)
  @override
  _$$_UnFavouriteCopyWith<_$_UnFavourite> get copyWith =>
      __$$_UnFavouriteCopyWithImpl<_$_UnFavourite>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Article article) favourite,
    required TResult Function(Article article) unfavourite,
  }) {
    return unfavourite(article);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Article article)? favourite,
    TResult Function(Article article)? unfavourite,
  }) {
    return unfavourite?.call(article);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Article article)? favourite,
    TResult Function(Article article)? unfavourite,
    required TResult orElse(),
  }) {
    if (unfavourite != null) {
      return unfavourite(article);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Favourite value) favourite,
    required TResult Function(_UnFavourite value) unfavourite,
  }) {
    return unfavourite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Favourite value)? favourite,
    TResult Function(_UnFavourite value)? unfavourite,
  }) {
    return unfavourite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Favourite value)? favourite,
    TResult Function(_UnFavourite value)? unfavourite,
    required TResult orElse(),
  }) {
    if (unfavourite != null) {
      return unfavourite(this);
    }
    return orElse();
  }
}

abstract class _UnFavourite implements ArticleEvent {
  factory _UnFavourite(final Article article) = _$_UnFavourite;

  @override
  Article get article;
  @override
  @JsonKey(ignore: true)
  _$$_UnFavouriteCopyWith<_$_UnFavourite> get copyWith =>
      throw _privateConstructorUsedError;
}
