import '../db/virtual_db.dart';
import '../interfaces/i_book_service.dart';
import '../model/book.dart';
import '../repositories/book_repository.dart';

class BookService extends IBookService {
  final BookRepository _bookRepo = BookRepository(VirtualDB());

  @override
  Future<List<Book>> getAllBooks() {
    return _bookRepo.getAll();
  }

  @override
  Future<void> addBook(Book book) {
    return _bookRepo.insert(book);
  }

  @override
  Future<void> removeBook(String id) {
    return _bookRepo.delete(id);
  }
}
