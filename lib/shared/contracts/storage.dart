abstract class IStorageService {
  Future<String?> get({String key});
  Future<void> delete({String key});
  Future<void> set({String key, String value});
  Future<void> deleteAll();
}
