import 'dart:convert';

import 'package:boticario_news/application/models/account_model.dart';
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
      final accountModel = AccountModel(
        token: account.token,
        username: account.username,
        id: account.id,
      );

      await localStorage.save(key: 'account', value: jsonEncode(accountModel));
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
