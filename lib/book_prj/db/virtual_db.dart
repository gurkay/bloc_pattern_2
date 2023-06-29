import '../services/guid_gen.dart';
import 'i_database.dart';

class VirtualDB extends IDatabase {
  final List<Map<String, dynamic>> _items = [];
  static final VirtualDB _db = VirtualDB._privateConstructor();

  VirtualDB._privateConstructor();

  factory VirtualDB() {
    return _db;
  }

  @override
  Future<void> insert(Map<String, dynamic> item) async {
    item['id'] = GUIDGen.generate();
    _items.add(item);
  }

  @override
  Future<void> remove(String id) async {
    _items.removeWhere((item) => item['id'] == id);
  }

  @override
  Future<void> update(Map<String, dynamic> updatedItem) async {
    int index = _items.indexWhere((item) => item['id'] == updatedItem['id']);
    _items[index] = updatedItem;
  }

  @override
  Future<List<Map<String, dynamic>>> list() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _items;
  }

  @override
  Future<Map<String, dynamic>?> findOne(String id) async {
    return _items.firstWhere((item) => item['id'] == id);
  }
}
