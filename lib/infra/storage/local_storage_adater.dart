import 'package:localstorage/localstorage.dart' as LocalStorageLib;
import '../../application/storage/local_storage.dart';
import 'package:meta/meta.dart' show required;

class LocalStorageAdapter implements LocalStorage {
  final LocalStorageLib.LocalStorage localStorage;

  LocalStorageAdapter({@required this.localStorage});

  @override
  Future<void> save({@required key, @required value}) async {
    await localStorage.setItem(key, value);
  }

  @override
  Future fetch({@required String key}) async {
    final data = await localStorage.getItem(key);
    return data;
  }
}
