import '../db/virtual_db.dart';
import '../model/book.dart';
import '../repositories/book_repository.dart';

class HomeController {
  final BookRepository _bookRepo = BookRepository(VirtualDB());

  Future<List<Book>> getAllBooks() {
    return _bookRepo.getAll();
  }

  Future<void> addBook(Book book) {
    return _bookRepo.insert(book);
  }

  Future<void> removeBook(String id) {
    return _bookRepo.delete(id);
  }
}
