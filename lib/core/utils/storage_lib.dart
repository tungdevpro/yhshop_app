import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

abstract class LocalStorage {
  LocalStorage._();
  static const String dbName = 'local.database';
  static late Box _box;

  static Future<void> initialize() async {
    if (!kIsWeb && !Hive.isBoxOpen(dbName)) Hive.init((await getApplicationDocumentsDirectory()).path);
    _box = await Hive.openBox(dbName);
  }

  static Future<void> put(String key, dynamic value) async {
    return await _box.put(key, value);
  }

  static Future<void> putAll(Map<dynamic, dynamic> value) async {
    return await _box.putAll(value);
  }

  static dynamic get(String key) {
    return _box.get(key);
  }

  static List<dynamic> getAll() {
    return _box.values.toList();
  }

  static Map<dynamic, dynamic> getBoxMap() {
    return _box.toMap();
  }

  static Future<void> delete(String key) {
    return _box.delete(key);
  }

  static Future<int> clear() {
    return _box.clear();
  }
}

abstract class StoreKey {
  StoreKey._();

  static const String auth = '@auth';
  static const String assetToken = '@asset_token';
  static const String intro = '@intro';
}
