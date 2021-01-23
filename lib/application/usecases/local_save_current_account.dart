import 'package:meta/meta.dart';

import '../../domain/entities/account_entity.dart';
import '../../domain/errors/domain_error.dart';
import '../../domain/usecases/save_current_account.dart';
import '../storage/local_storage.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccount {
  final LocalStorage localStorage;

  LocalSaveCurrentAccount({@required this.localStorage});

  @override
  Future<void> save(AccountEntity account) async {
    try {
      await localStorage.save(key: 'token', value: account.token);
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
