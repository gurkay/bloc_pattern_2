import '../db/i_database.dart';
import '../model/book.dart';
import 'i_book_repository.dart';

class BookRepository implements IBookRepository {
  final IDatabase _db;

  BookRepository(this._db);

  @override
  Future<List<Book>> getAll() async {
    var items = await _db.list();
    return items.map((item) => Book.fromMap(item)).toList();
  }

  @override
  Future<Book?> getOne(String id) async {
    var item = await _db.findOne(id);
    return item != null ? Book.fromMap(item) : null;
  }

  @override
  Future<void> insert(Book book) async {
    await _db.insert(book.toMap());
  }

  @override
  Future<void> update(Book book) async {
    await _db.update(book.toMap());
  }

  @override
  Future<void> delete(String id) async {
    await _db.remove(id);
  }
}
