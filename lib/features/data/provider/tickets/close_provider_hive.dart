import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CloseProviderHive extends ChangeNotifier {
  final Box _userBox;

  CloseProviderHive(this._userBox);

  List<Map<String, dynamic>> get items {
    final data = _userBox.keys.map((key) {
      final item = _userBox.get(key);
      return {
        "key": key,
        "name": item["name"],
        "place": item["place"],
      };
    }).toList();
    return data.reversed.toList();
  }

  Future<void> createItem(Map<String, dynamic> newItem) async {
    await _userBox.add(newItem);
    notifyListeners();
  }

  Future<void> deleteItem(int itemKey) async {
    await _userBox.delete(itemKey);
    notifyListeners();
  }

  Future<void> updateItem(int itemKey, Map<String, dynamic> item) async {
    await _userBox.put(itemKey, item);
    notifyListeners();
  }
}
