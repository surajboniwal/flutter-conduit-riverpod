import 'dart:convert';

class User {
  final String email;
  final String username;
  final String? bio;
  final String? image;
  User({
    required this.email,
    required this.username,
    this.bio,
    this.image,
  });

  User copyWith({
    String? email,
    String? username,
    String? bio,
    String? image,
  }) {
    return User(
      email: email ?? this.email,
      username: username ?? this.username,
      bio: bio ?? this.bio,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'username': username,
      'bio': bio,
      'image': image,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] as String,
      username: map['username'] as String,
      bio: map['bio'] != null ? map['bio'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(email: $email, username: $username, bio: $bio, image: $image)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.username == username &&
        other.bio == bio &&
        other.image == image;
  }

  @override
  int get hashCode {
    return email.hashCode ^ username.hashCode ^ bio.hashCode ^ image.hashCode;
  }
}
