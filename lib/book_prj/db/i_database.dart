abstract class IDatabase {
  Future<void> insert(Map<String, dynamic> item);
  Future<void> remove(String id);
  Future<void> update(Map<String, dynamic> updatedItem);
  Future<List<Map<String, dynamic>>> list();
  Future<Map<String, dynamic>?> findOne(String id);
}
