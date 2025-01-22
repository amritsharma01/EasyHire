import 'package:hive_flutter/hive_flutter.dart';
import '../../../abstractservices/storage_services.dart';
import '../get.dart';

//Centralization of all the Hive related Stuff

class HiveStorageService implements StorageServices {
  HiveStorageService({required this.boxName});
  late Box<dynamic> hiveBox;
  final String boxName;

  @override
  Future<StorageServices> init() async {
    final dir = await Get.directory;
    Hive.init(dir.path);
    hiveBox = await Hive.openBox(boxName);
    return this;
  }

  @override
  Future<void> remove(String key) async {
    await hiveBox.delete(key);
  }

  @override
  dynamic get(String key) async {
    return await hiveBox.get(key);
  }

  @override
  dynamic getAll() async {
    return hiveBox.values.toList();
  }

  @override
  Future<bool> has(String key) async {
    return hiveBox.containsKey(key);
  }

  @override
  Future<void> set(String? key, dynamic data) async {
    await hiveBox.put(key, data);
  }

  @override
  Future<void> clear() async {
    await hiveBox.clear();
  }

  @override
  Future<void> close() async {
    await hiveBox.close();
  }

  @override
  Future<void> deleteBox() async {
    await hiveBox.clear();
    await Hive.box(boxName).clear();
  }
}
