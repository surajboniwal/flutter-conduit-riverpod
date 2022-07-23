import 'dart:convert';

class Author {
  final String username;
  final String? bio;
  final String image;
  final bool following;
  Author({
    required this.username,
    this.bio,
    required this.image,
    required this.following,
  });

  Author copyWith({
    String? username,
    String? bio,
    String? image,
    bool? following,
  }) {
    return Author(
      username: username ?? this.username,
      bio: bio ?? this.bio,
      image: image ?? this.image,
      following: following ?? this.following,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'bio': bio,
      'image': image,
      'following': following,
    };
  }

  factory Author.fromMap(Map<String, dynamic> map) {
    return Author(
      username: map['username'] as String,
      bio: map['bio'] != null ? map['bio'] as String : null,
      image: map['image'] as String,
      following: map['following'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Author.fromJson(String source) =>
      Author.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Author(username: $username, bio: $bio, image: $image, following: $following)';
  }

  @override
  bool operator ==(covariant Author other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.bio == bio &&
        other.image == image &&
        other.following == following;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        bio.hashCode ^
        image.hashCode ^
        following.hashCode;
  }
}
