import 'author.dart';

class Book {
  final int userId;
  final int id;
  final String title;
  final String body;
  final String imageUrl;
  final Author author;

  Book({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    required this.imageUrl,
    required this.author,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
      imageUrl: json['image_url'],
      author: Author.fromJson(json['author']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
      'image_url': imageUrl,
      'author': author.toJson(),
    };
  }
}
