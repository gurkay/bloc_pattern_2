import 'package:bloc_pattern_2/book_prj/interfaces/i_book_controller.dart';
import 'package:bloc_pattern_2/book_prj/services/book_service.dart';

import '../model/book.dart';

class BookController extends IBookController {
  final BookService _bookService = BookService();

  @override
  Future<List<Book>> getAllBooks() {
    return _bookService.getAllBooks();
  }

  @override
  Future<void> addBook(Book book) {
    return _bookService.addBook(book);
  }

  @override
  Future<void> removeBook(String id) {
    return _bookService.removeBook(id);
  }
}
