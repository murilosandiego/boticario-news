import 'package:mesa_news/application/storage/local_storage.dart';
import 'package:mesa_news/domain/entities/account.dart';
import 'package:mesa_news/domain/errors/domain_error.dart';
import 'package:mesa_news/domain/usecases/save_current_account.dart';
import 'package:meta/meta.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccount {
  final LocalStorage localStorage;

  LocalSaveCurrentAccount({@required this.localStorage});

  @override
  Future<void> save(Account account) async {
    try {
      await localStorage.save(key: 'token', value: account.token);
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
