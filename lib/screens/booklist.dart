import 'package:book_app2/services/db_helper.dart';
import 'package:flutter/material.dart';
import '../models/book_model.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final List<Book> _books = [];
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  Future<void> _loadBooks() async {
    final data = await _dbHelper.getBooks();
    setState(() {
      _books.clear();
      _books.addAll(data.map((item) => Book.fromMap(item)).toList());
    });
  }

  Future<void> _addBook(String title, String author) async {
    final book = Book(
      id: DateTime.now().toString(),
      title: title,
      author: author,
    );
    await _dbHelper.insertBook(book.toMap());
    _loadBooks();
  }

  Future<void> _editBook(String id, String title, String author) async {
    final updatedBook = Book(
      id: id,
      title: title,
      author: author,
    );
    await _dbHelper.updateBook(id, updatedBook.toMap());
    _loadBooks();
  }

  Future<void> _deleteBook(String id) async {
    await _dbHelper.deleteBook(id);
    _loadBooks();
  }

  void _showBookForm([Book? book]) {
    final titleController = TextEditingController(text: book?.title);
    final authorController = TextEditingController(text: book?.author);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(book == null ? 'Add Book' : 'Edit Book',
            style: TextStyle(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: authorController,
              decoration: const InputDecoration(
                labelText: 'Author',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (book == null) {
                _addBook(
                  titleController.text,
                  authorController.text,
                );
              } else {
                _editBook(
                  book.id,
                  titleController.text,
                  authorController.text,
                );
              }
              Navigator.of(ctx).pop();
            },
            child: const Text('Save'),
            
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Books📖'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 250, 144, 44),
      ),
      body: _books.isEmpty
          ? Center(
              child: Text(
                'No books available. Add some!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _books.length,
              itemBuilder: (ctx, index) {
                final book = _books[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 250, 144, 44),
                      child: Text(
                        book.title[0],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      book.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Author: ${book.author}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          color: Colors.blue,
                          onPressed: () => _showBookForm(book),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: const Color.fromARGB(255, 248, 32, 16),
                          onPressed: () => _deleteBook(book.id),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 115, 0),
        onPressed: () => _showBookForm(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
