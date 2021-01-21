import 'package:mesa_news/application/storage/local_storage.dart';
import 'package:mesa_news/domain/entities/account.dart';
import 'package:mesa_news/domain/errors/domain_error.dart';
import 'package:mesa_news/domain/usecases/load_current_account.dart';
import 'package:meta/meta.dart';

class LocalLoadCurrentAccount implements LoadCurrentAccount {
  final LocalStorage localStorage;

  LocalLoadCurrentAccount({@required this.localStorage});
  @override
  Future<Account> load() async {
    try {
      final token = await localStorage.fetch(key: 'token');
      return Account(token: token);
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
