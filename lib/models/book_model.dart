class Book {
  final String id;
  String title;
  String author;

  Book({
    required this.id,
    required this.title,
    required this.author,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'author': author};
  }

  static Book fromMap(Map<String, dynamic> map) {
    return Book(id: map['id'], title: map['title'], author: map['author']);
  }
}
