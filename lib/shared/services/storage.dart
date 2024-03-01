

import 'package:rq_soap/shared/contracts/storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService implements IStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<String?> get({String? key}) {
    return _storage.read(key: key!);
  }

  @override
  Future<void> delete({String? key}) {
    return _storage.delete(key: key!);
  }

  @override
  Future<void> set({String? key, String? value}) {
    return _storage.write(key: key!, value: value);
  }

  @override
  Future<void> deleteAll() {
    return _storage.deleteAll();
  }
}