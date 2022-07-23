import 'package:hive_flutter/hive_flutter.dart';

enum StorageKey { token }

enum Storage {
  config,
}

extension StorageX on Storage {
  Box get box => Hive.box(name);

  Future<void> openBox() async => await Hive.openBox(name);

  void add(StorageKey key, String value) => box.put(key.name, value);

  String? get(StorageKey key) => box.get(key.name);
}
