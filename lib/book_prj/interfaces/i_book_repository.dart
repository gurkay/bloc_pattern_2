import '../model/book.dart';

abstract class IBookRepository {
  Future<List<Book>> getAll();
  Future<Book?> getOne(String id);
  Future<void> insert(Book book);
  Future<void> update(Book book);
  Future<void> delete(String id);
}
