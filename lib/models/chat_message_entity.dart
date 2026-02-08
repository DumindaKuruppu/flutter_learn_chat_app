class ChatMessageEntity {
  String id;
  String text;
  String? imageUrl;
  int createdAt;
  Author author;

  ChatMessageEntity({
    required this.text,
    required this.id,
    required this.createdAt,
    required this.author,
    this.imageUrl,
  });

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMessageEntity(
      text: json['text'],
      id: json['id'],
      createdAt: json['createdAt'],
      imageUrl: json['image'],
      author: Author.fromJson(json['author']),
    );
  }
}

class Author {
  String userName;

  Author({required this.userName});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(userName: json['username']);
  }
}
