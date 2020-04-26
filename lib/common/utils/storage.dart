// import 'package:flutter_ducafecat_news/common/values/values.dart';
// import 'package:localstorage/localstorage.dart';

// /// 本地存储
// /// 单例 StorageUtil().getItem('key')
// class StorageUtil {
//   static final StorageUtil _singleton = new StorageUtil._internal();
//   LocalStorage _storage;

//   factory StorageUtil() {
//     return _singleton;
//   }

//   StorageUtil._internal() {
//     _storage = new LocalStorage(STORAGE_MASTER_KEY);
//   }

//   String getItem(String key) {
//     return _storage.getItem(key);
//   }

//   Future<void> setItem(String key, String val) async {
//     await _storage.setItem(key, val);
//   }
// }
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// 本地存储
class StorageUtil {
  static StorageUtil _instance = new StorageUtil._();
  factory StorageUtil() => _instance;
  static SharedPreferences _prefs;

  StorageUtil._();

  static Future<void> init() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  /// 设置 json 对象
  Future<bool> setJSON(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    return _prefs.setString(key, jsonString);
  }

  /// 获取 json 对象
  dynamic getJSON(String key) {
    String jsonString = _prefs.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }
}
