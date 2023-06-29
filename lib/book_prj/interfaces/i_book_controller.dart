import '../model/book.dart';

abstract class IBookController {
  Future<List<Book>> getAllBooks();
  Future<void> addBook(Book book);
  Future<void> removeBook(String id);
}
